const mysql = require('mysql');

console.log('Connexion');

const connexion = mysql.createConnection({
    database: 'odelice',
    host: "localhost",
    user: "root",
    password: ""
});

connexion.query('USE odelice');
module.exports = connexion;