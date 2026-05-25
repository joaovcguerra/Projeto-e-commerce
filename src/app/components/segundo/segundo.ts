import { Component, OnDestroy, OnInit } from '@angular/core';

@Component({
  selector: 'app-segundo',
  imports: [],
  standalone: true,
  templateUrl: './segundo.html',
  styleUrl: './segundo.scss',
})
export class Segundo implements OnInit, OnDestroy {
  ngOnInit(): void {
    console.log('SegundoComponent onInit');
  }

  ngOnDestroy(): void {
    console.log('SegundoComponent Destroy');
  }
}
