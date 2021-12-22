const mysql = require('mysql');

var connection = mysql.createConnection({
    host: '127.0.0.1',
    user: 'nodepro',
    password: '',
    database: 'xyz_company',
    multipleStatements: true
});

connection.connect((err) => {
    if (!err)
        console.log('DB connection succeded.');
    else
        console.log('DB connection failed \n Error: ' + JSON.stringify(err, undefined, 2));
});

module.exports = connection;