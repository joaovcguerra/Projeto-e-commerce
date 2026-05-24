import mariadb from 'mariadb';

const pool = mariadb.createPool({
  host: '127.0.0.1',
  user: 'davi', 
  password: '', 
  connectionLimit: 5,
  multipleStatements: true 
});

export default pool;
