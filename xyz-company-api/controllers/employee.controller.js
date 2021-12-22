const db = require("../connection");

exports.getEmployees = async(req, res) => {
    try {
        db.query('SELECT * FROM employee', (err, rows, fields) => {
            if (!err)
                res.status(200).json(rows);
            else
                res.status(404).json(err);
        });
    } catch (err) {
        res.status(404).json(err);
    }

};

exports.getEmployeeById = async(req, res) => {
    try {
        db.query('SELECT * FROM employee WHERE id = ?', [req.params.id], (err, rows, fields) => {
            if (!err)
                if (rows.length > 0)
                    res.status(200).json(rows);
                else
                    res.status(200).json({ message: "Id doesn't exits" });
            else
                res.status(404).json(err);
        });
    } catch (err) {
        res.status(404).json(err);
    }

};

exports.employeeInsertOrUpdate = async(req, res) => {
    try {
        const emp = req.body;
        const sql = "SET @id = ? ; SET @name = ? ; SET @age = ? ; SET @department = ? ; CALL employeeInsertOrUpdate(@id, @name, @age, @department);";

        db.query(sql, [emp.id, emp.name, emp.age, emp.department], (err, rows, fields) => {
            if (!err)
                rows.forEach(element => {
                    if (element.constructor == Array)
                        if (element[0].type == "Inserted Successfully")
                            res.status(201).json({ status: element[0].type });
                        else
                            res.status(200).json({ status: element[0].type });
                });

            else
                res.status(400).json(err);
        })
    } catch (err) {
        res.status(404).json(err);
    }

};

exports.deleteEmployeeById = async(req, res) => {
    try {
        db.query('DELETE FROM employee WHERE id = ?', [req.params.id], (err, rows, fields) => {
            if (!err)
                if (rows.affectedRows == 1)
                    res.status(200).json({ message: "Deleted Successfully" });
                else
                    res.status(200).json({ message: "Id doesn't exits" });
            else
                res.status(404).json(err);
        });
    } catch (err) {
        res.status(404).json(err);
    }

};