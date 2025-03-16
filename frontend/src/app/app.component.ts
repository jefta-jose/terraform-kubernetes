import { Component, OnInit } from '@angular/core';
import { IMovie } from './Models/movies';
import { MovieService } from '../services/movie.service';
import { CommonModule, DatePipe } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, DatePipe],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss',
})
export class AppComponent implements OnInit {
  movies!: IMovie[];
  isLoading: boolean = true;
  errorMessage: string | null = null;

  constructor(private ts: MovieService) {}

  ngOnInit(): void {
    this.ts.getMovies().subscribe({
      next: (movies) => {
        this.movies = movies;
        this.isLoading = false;
      },
      error: (error) => {
        console.error('Error fetching movies:', error);
        this.errorMessage = 'Failed to load movies. Please try again later.';
        this.isLoading = false;
      },
      complete: () => {
        console.log('Movie fetching completed');
      },
    });
  }
}
