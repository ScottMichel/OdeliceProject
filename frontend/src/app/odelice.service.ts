import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class OdeliceService {


  static readonly URL = "http://localhost:3000/"

  constructor(private http:HttpClient) { }

  public findAllRecipes(){
    return this.http.get(OdeliceService.URL + 'recette')
  };
  public findOne(id: any) {
    return this.http.get(OdeliceService.URL + 'recette/' + id)
  };
  public findBytitle(queryParameters) {
    return this.http.get(OdeliceService.URL + 'recette/search', {params: queryParameters})
  };
  public findAllComments(id: any) {
    return this.http.get(OdeliceService.URL + 'recette/commentaire' + id)
  };
}
