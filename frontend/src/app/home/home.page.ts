import { Component } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { OdeliceService } from '../odelice.service'; //import effectué avec l'injection du service dans le constructor
import { NavController } from '@ionic/angular';
import { NavigationExtras } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  public odeliceList:Array <{idRecette: number, titre: string, cuisson: string, repos: String, difficulte: string, image: string, preparation: string}> = [];

  public saisie;

//Injection du service OdeliceService
  constructor(private odeliceService: OdeliceService, private navCtrl: NavController) { }

  public searchRecette(){
    let queryParameters = new HttpParams()
      .set('titre', this.saisie);
      
    this.odeliceService.findBytitle(queryParameters).subscribe((data:any) => {
      console.log(data)
      this.odeliceList = data;
    });
  }

  ionViewDidEnter(){
    this.odeliceService.findAllRecipes().subscribe((data:any) => {
      console.log(data)
      this.odeliceList = data;
    })
  }
  public showDetails(recette){
    console.log(recette);

    const extras: NavigationExtras = {
      state: {
        recette: recette
      }
    }
    this.navCtrl.navigateForward('/detail-recette',extras);
  }

}
