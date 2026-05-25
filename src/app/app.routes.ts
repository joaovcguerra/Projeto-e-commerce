import { Routes } from '@angular/router';
import { Inicial } from './components/inicial/inicial';

// export const routes: Routes = [
//     {path: 'primeiro', component: Primeiro},
//     {path: 'segundo', component: Segundo}
// ];

// export const routes: Routes = [
//     {path: 'componentes', component: Base},
//     {path: 'componentes/primeiro', component: Primeiro},
//     {path: 'componentes/segundo', component: Segundo}
// ];

export const routes: Routes = [
        // .then()  -> Serve para trazer o modulo desse componente, como o exemplo é um standAlone, meu componente tambem se comporta como modulo, sendo seu modulo o nome da classe.
        // Ou seja, preciso passar para o seu construtor que: .then( moduloASerImportado é => moduloASerImportado.Base).
        // Visualizamos duas coisas aqui: Quando carregar /componentes -> loadComponent () => Importo o caminho do componente -> Então (modulo => modulo.Base <- Nome da classe ts do component)
        {
                path: '',
                title: 'Inicial',
                component: Inicial,
        },
        {
                path: 'componentes',
                 title: 'Base',
                loadComponent: () => import('./components/base/base').then(m => m.Base)
        },

        {
                path: 'componentes/primeiro', 
                title: 'Primeiro',
                loadComponent: () => import('./components/primeiro/primeiro').then(m => m.Primeiro)
        },

        {
                path: 'componentes/segundo',
                 title: 'Segundo',
                loadComponent: () => import('./components/segundo/segundo').then(m => m.Segundo)
        },

];
