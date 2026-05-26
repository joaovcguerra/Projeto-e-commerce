import { DashBoardRepository } from "../repositories/DashBoardRepository.js";

export class DashBoardService{
    private repository: DashBoardRepository;
    constructor() {
    this.repository = new DashBoardRepository();
  }

  async obterGraficoVendasProdutos() {
    try {
      const dados = await this.repository.fetchVendasProdutos();
      // Se precisar tratar ou ordenar os dados no futuro, fazemos aqui
      return dados;
    } catch (error) {
      throw new Error(`Erro no Service ao processar Vendas de Produtos: ${error}`);
    }
  }

  async obterGraficoVendedorBonus() {
    try {
      return await this.repository.fetchVendedorBonus();
    } catch (error) {
      throw new Error(`Erro no Service ao processar Bônus: ${error}`);
    }
  }

  // 3. Processa dados para o Gráfico de Compras dos Clientes
  async obterGraficoVendasClientes() {
    try {
      return await this.repository.fetchVendasClientes();
    } catch (error) {
      throw new Error(`Erro no Service ao processar Vendas por Cliente: ${error}`);
    }
  }

  // 4. Processa dados para o Gráfico de Estoque/Produtos por Vendedor
  async obterGraficoProdutosVendedores() {
    try {
      return await this.repository.fetchProdutosVendedores();
    } catch (error) {
      throw new Error(`Erro no Service ao processar Produtos por Vendedor: ${error}`);
    }
  }

  async obterGraficoProdutos() {
    try {
      const dados = await this.repository.fetchProdutos();
      return dados;
    } catch (error) {
      throw new Error(`Erro no Service ao processar Produtos: ${error}`);
    }
  }
}