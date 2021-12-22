const express = require('express');
const PORT = process.env.PORT || 8001;

const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

const employeeRouter = require('./routes/employee');
app.use('/employees', employeeRouter);

app.listen(PORT, () => {
    console.log(`Server Started on http://localhost:${PORT}`);
});