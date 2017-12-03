var mysql = require('mysql');
var pool = mysql.createPool({
    host : 'classmysql.engr.oregonstate.edu',
    user : 'cs290_sunde',
    password : '8899',
    database: 'cs290_sunde'
});
module.exports.pool = pool;