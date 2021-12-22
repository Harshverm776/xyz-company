const express = require('express');
const router = express.Router();
const { getEmployees, getEmployeeById, employeeInsertOrUpdate, deleteEmployeeById } = require('../controllers/employee.controller');

router.get('/', getEmployees);
router.get('/:id', getEmployeeById);
router.post('/', employeeInsertOrUpdate);
router.delete('/:id', deleteEmployeeById);


module.exports = router;