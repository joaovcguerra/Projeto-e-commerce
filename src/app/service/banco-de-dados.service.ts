import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class BancoDeDadosService {
  
  private readonly apiURL = 'http://localhost:3000/api/dashboard';

  constructor(
    private readonly _http: HttpClient
  ){}

  getVendasProdutos(): Observable<any[]> {
    return this._http.get<any[]>(`${this.apiURL}/vendas-produtos`);
  }

  getVendedorBonus(): Observable<any[]> {
    return this._http.get<any[]>(`${this.apiURL}/vendedor-bonus`);
  }

  getVendasClientes(): Observable<any[]> {
    return this._http.get<any[]>(`${this.apiURL}/vendas-clientes`);
  }

  getProdutosVendedores(): Observable<any[]> {
    return this._http.get<any[]>(`${this.apiURL}/produtos-vendedores`);
  }

}
