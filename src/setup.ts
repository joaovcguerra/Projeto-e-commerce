import fs from 'fs';
import path from 'path';
import pool from './database';



async function inicializarBanco() {
    let conn;
    try {
        conn = await pool.getConnection();

        console.log("Destruindo o banco antigo e criando um novo...");
        await conn.query("DROP DATABASE IF EXISTS ecommerce_projeto;");
        await conn.query("CREATE DATABASE ecommerce_projeto;");
        await conn.query("USE ecommerce_projeto;");


        const sqlDir = path.join(__dirname, '../projectDatabase');


        console.log("Criando tabelas...");
        const tablesSql = fs.readFileSync(path.join(sqlDir, 'database_tables.sql'), 'utf-8');
        await conn.query(tablesSql);


        console.log("Inserindo dados base (produtos, clientes, cargos)...");
        const insertsSql = fs.readFileSync(path.join(sqlDir, 'database_inserts.sql'), 'utf-8');
        await conn.query(insertsSql);


        console.log("Criando views...");
        const viewsSql = fs.readFileSync(path.join(sqlDir, 'database_views.sql'), 'utf-8');
        await conn.query(viewsSql);

        console.log("Criando triggers...");
        const triggersSql = fs.readFileSync(path.join(sqlDir, 'database_triggers.sql'), 'utf-8');
        await conn.query(triggersSql);

        console.log("Criando procedures...");
        const proceduresSql = fs.readFileSync(path.join(sqlDir, 'database_procedures.sql'), 'utf-8');
        await conn.query(proceduresSql);

        console.log("Configurando usuários e permissões...");
        const usersSql = fs.readFileSync(path.join(sqlDir, 'database_users.sql'), 'utf-8');
        await conn.query(usersSql);

        console.log("Banco de dados inicializado com sucesso!");


    } catch (err) {
        console.error("Erro ao configurar banco de dados: ", err);
    } finally {
        if (conn) {
            conn.release();
            pool.end();
        }
    }
}

inicializarBanco();