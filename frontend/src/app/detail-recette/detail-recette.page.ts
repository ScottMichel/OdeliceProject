import { Component, OnInit } from '@angular/core';
import { OdeliceService } from '../odelice.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-detail-recette',
  templateUrl: './detail-recette.page.html',
  styleUrls: ['./detail-recette.page.scss'],
})
export class DetailRecettePage implements OnInit {

  public commentaireList:Array <{idcommentaire: number, text: string, auteur: string, email: String, note: string, idRecette: number}> = [];


  public recette = {
    idRecette:'',
    titre : '',
    cuisson: '', 
    repos: '',
    difficulte: '',
    image: '',
    preparation:''
  };

  public commentaire = {
    text : '',
    auteur : '',
    email : '',
    note : ''
  }


  constructor(private route: ActivatedRoute, private router: Router, private odeliceService: OdeliceService) { 
    console.log(this.router.getCurrentNavigation().extras.state);

    this.route.queryParams.subscribe(
      () => {
        if(this.router.getCurrentNavigation().extras.state.recette){
          this.recette = this.router.getCurrentNavigation().extras.state.recette;
          this.odeliceService.findAllComments(this.recette.idRecette).subscribe((data:any) => {
            console.log(data)
            this.commentaireList = data;
        }
        )}
      }
    );
   
  }
  ngOnInit() { 
  }
}
