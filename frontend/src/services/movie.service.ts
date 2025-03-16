import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { IMovie } from '../app/Models/movies';

@Injectable({
    providedIn: 'root',
})
export class MovieService {
    private readonly Base_Url = 'http://localhost:5169/movies/';
    constructor(private http: HttpClient) { }

    getMovies(): Observable<IMovie[]> {
        return this.http.get<IMovie[]>(this.Base_Url)
    }
}