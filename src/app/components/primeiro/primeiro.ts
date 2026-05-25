import { Component, OnDestroy, OnInit } from '@angular/core';

@Component({
  selector: 'app-primeiro',
  imports: [],
  standalone: true,
  templateUrl: './primeiro.html',
  styleUrl: './primeiro.scss',
})
// So executa a lógica quando a rota seja carregada 
export class Primeiro implements OnInit, OnDestroy{
  ngOnInit(): void {
    console.log('PrimeiroComponent Init');
  }

  ngOnDestroy(): void {
    console.log('PrimeiroComponent Destroy')
  }

}
