using Microsoft.EntityFrameworkCore;
using MoviesHubApi.Entities;

namespace MoviesHubApi.Data
{
    public class MovieContext : DbContext
    {
        public MovieContext(DbContextOptions<MovieContext> options)
            : base(options) { }

        public DbSet<Movie> Movies { get; set; }
        public DbSet<Genre> Genres { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Seed Genres
            modelBuilder
                .Entity<Genre>()
                .HasData(
                    new Genre { Id = 1, Name = "Action" },
                    new Genre { Id = 2, Name = "Sci-Fi" },
                    new Genre { Id = 3, Name = "Horror" },
                    new Genre { Id = 4, Name = "Fantasy" },
                    new Genre { Id = 5, Name = "Romance" }
                );

            // Seed Movies
            modelBuilder
                .Entity<Movie>()
                .HasData(
                    new Movie
                    {
                        Id = 1,
                        Name = "The Dark Knight",
                        Price = 12.99m,
                        ReleaseDate = DateOnly.FromDateTime(new DateTime(2008, 7, 18)),
                        GenreId = 1, // Action
                    },
                    new Movie
                    {
                        Id = 2,
                        Name = "Inception",
                        Price = 15.99m,
                        ReleaseDate = DateOnly.FromDateTime(new DateTime(2010, 7, 16)),
                        GenreId = 2, // Sci-Fi
                    },
                    new Movie
                    {
                        Id = 3,
                        Name = "The Conjuring",
                        Price = 10.99m,
                        ReleaseDate = DateOnly.FromDateTime(new DateTime(2013, 7, 19)),
                        GenreId = 3, // Horror
                    },
                    new Movie
                    {
                        Id = 4,
                        Name = "Harry Potter and the Philosopher's Stone",
                        Price = 9.99m,
                        ReleaseDate = DateOnly.FromDateTime(new DateTime(2001, 11, 16)),
                        GenreId = 4, // Fantasy
                    },
                    new Movie
                    {
                        Id = 5,
                        Name = "The Notebook",
                        Price = 7.99m,
                        ReleaseDate = DateOnly.FromDateTime(new DateTime(2004, 6, 25)),
                        GenreId = 5, // Romance
                    }
                );

            // Configure Price column
            modelBuilder.Entity<Movie>().Property(m => m.Price).HasColumnType("decimal(18,2)");
        
        }
    }
}
