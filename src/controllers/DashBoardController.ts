import { Request, Response } from 'express';
import { DashBoardService } from '../services/DashBoardService.js';

export class DashboardController {
  private service: DashBoardService;

  constructor() {
    this.service = new DashBoardService();
  }

  // Rota 1: Vendas por Produto
  getVendasProdutos = async (req: Request, res: Response): Promise<void> => {
    try {
      const dados = await this.service.obterGraficoVendasProdutos();
      res.status(200).json(dados);
    } catch (error: any) {
      res.status(500).json({ error: error.message });
    }
  };

  // Rota 2: Bônus dos Vendedores
  getVendedorBonus = async (req: Request, res: Response): Promise<void> => {
    try {
      const dados = await this.service.obterGraficoVendedorBonus();
      res.status(200).json(dados);
    } catch (error: any) {
      res.status(500).json({ error: error.message });
    }
  };

  // Rota 3: Compras e Gastos dos Clientes
  getVendasClientes = async (req: Request, res: Response): Promise<void> => {
    try {
      const dados = await this.service.obterGraficoVendasClientes();
      res.status(200).json(dados);
    } catch (error: any) {
      res.status(500).json({ error: error.message });
    }
  };

  // Rota 4: Produtos e Estoque por Vendedor
  getProdutosVendedores = async (req: Request, res: Response): Promise<void> => {
    try {
      const dados = await this.service.obterGraficoProdutosVendedores();
      res.status(200).json(dados);
    } catch (error: any) {
      res.status(500).json({ error: error.message });
    }
  };

  getProdutos = async (req: Request, res: Response): Promise<void> => {
    try {
      const dados = await this.service.obterGraficoProdutos();
      res.status(200).json(dados);
    } catch (error: any) {
      res.status(500).json({ error: error.message });
    }

  }
}