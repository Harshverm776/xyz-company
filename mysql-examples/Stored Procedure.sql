-- DB configuration

use purchase_order;

CREATE TABLE `purchase_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `buyer_name` varchar(255) NOT NULL,
  `buyer_address` varchar(255) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL DEFAULT 'Not Updated',
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `item_name` varchar(255) NOT NULL,
  `item_description` varchar(255) NOT NULL,
  `item_unit_measurement` varchar(255) NOT NULL,
  `item_unit_price` int NOT NULL,
  `vendor_name` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `total_amount` int NOT NULL,
  `create_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
);

SELECT * FROM purchase_order.purchase_orders;

-- Stored Procedure

DELIMITER $$
Create Procedure getItemByQuantityMoreThan(in quantity integer, out totalItems integer)
BEGIN
	Select * from purchase_orders where purchase_orders.quantity > quantity;
	select count(*) into totalItems from purchase_orders;
END$$
DELIMITER ;

-- calling stored procedure

Call getItemByQuantityMoreThan(3, @totalItems);

Select @totalItems;