import mysql from 'mysql2/promise';

const dbConfig = {
    host: 'localhost',
    user: 'root',
    password: '0159753',
    database: 'ecommerce',
    multipleStatements: true
};

export const pool = mysql.createPool(dbConfig);

