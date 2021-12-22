-- DB configuration

use supplier_system;

CREATE TABLE `purchase_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `po_id` int NOT NULL,
  `buyer_name` varchar(255) NOT NULL,
  `buyer_address` varchar(255) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_description` varchar(255) NOT NULL,
  `item_unit_measurement` varchar(255) NOT NULL,
  `item_unit_price` int NOT NULL,
  `vendor_name` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `total_amount` int NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
);

SELECT * FROM supplier_system.purchase_orders;

-- stored function

DELIMITER $$
create function getDiscountPercentage(
	totalAmount integer
)
returns integer
deterministic
begin
	declare discountPercentage integer;
	
    if totalAmount < 50000 then
		set discountPercentage = 10;
	elseif totalAmount < 100000 then
		set discountPercentage = 20;
	else 
		set discountPercentage = 25;
    end if;
		return discountPercentage;
end$$
DELIMITER ;

-- using stored function

Select id, buyer_name, concat(getDiscountPercentage(total_amount),"%") as discount from purchase_orders;

-- creating view 

create view purchase_orders_with_discount as
Select id, buyer_name, concat(getDiscountPercentage(total_amount),"%") as discount from purchase_orders;

select * from purchase_orders_with_discount;