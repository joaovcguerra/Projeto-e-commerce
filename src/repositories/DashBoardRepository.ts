import { pool } from "../config/databaseConfig.js";

 export class DashBoardRepository {
    async fetchVendasProdutos() {
    const [rows] = await pool.query('SELECT * FROM view_total_vendas_produto');
    return rows;
  }

  async fetchVendedorBonus() {
    const [rows] = await pool.query('SELECT * FROM vendedor_bonus');
    return rows;
  }

  async fetchVendasClientes() {
    const [rows] = await pool.query('SELECT * FROM view_vendas_clientes');
    return rows;
  }

  async fetchProdutosVendedores() {
    const [rows] = await pool.query('SELECT * FROM view_produtos_vendedores');
    return rows;
  }

  async fetchProdutos(){
    const [rows] = await pool.query('SELECT * FROM produto');
    return rows;
  }

}