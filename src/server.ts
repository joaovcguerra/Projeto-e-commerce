import express from 'express';
import cors from 'cors';
import { DashboardController } from './controllers/DashBoardController.js'; // Lembre do .js no final por causa do nodenext!

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

const dashboardController = new DashboardController();

// Rotas que chamam o controller
app.get('/api/dashboard/vendas-produtos', dashboardController.getVendasProdutos);
app.get('/api/dashboard/vendedor-bonus', dashboardController.getVendedorBonus);
app.get('/api/dashboard/vendas-clientes', dashboardController.getVendasClientes);
app.get('/api/dashboard/produtos-vendedores', dashboardController.getProdutosVendedores);
app.get('/api/dashboard/produtos', dashboardController.getProdutos);

app.listen(port, () => {
  console.log(`🚀 API do E-commerce rodando em http://localhost:${port}`);
});