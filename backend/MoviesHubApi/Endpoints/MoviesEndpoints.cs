using Microsoft.EntityFrameworkCore;
using MoviesHubApi.Data;
using MoviesHubApi.Entities;

namespace MoviesHubApi.Endpoints

{
    public static class MoviesEndpoints
    {

        //Extension based
        public static RouteGroupBuilder MapMoviesEndpoints(this WebApplication app)
        {
            var group = app.MapGroup("/movies").WithParameterValidation();

            //GET /movies
            group.MapGet("/", async (MovieContext movieContext) => await movieContext.Movies.Include("Genre").ToListAsync());

            //POST /movies
            group.MapPost("/", async (MovieContext movieContext, Movie newMovie) => { 

                newMovie.Genre = await movieContext.Genres.FirstOrDefaultAsync(x => x.Id == newMovie.GenreId);
                movieContext.Movies.Add(newMovie);
                await movieContext.SaveChangesAsync();
                return Results.Created($"/movies/{newMovie.Id}", newMovie);

            });

            //GET /movies/id
            group.MapGet("/{id}", async (MovieContext movieContext, int id) => {
                Movie? movie = await movieContext.Movies.Include("Genre").FirstOrDefaultAsync(x => x.Id == id);
                return movie is null ? Results.NotFound() : Results.Ok(movie);
            });

            // PUT /movies/{id} (Update)
            group.MapPut("/{id}", async (MovieContext movieContext, int id, Movie updatedMovie) =>
            {
                Movie? movie = await movieContext.Movies.FindAsync(id);
                if (movie is null) return Results.NotFound();

                // Update fields only if new values are provided
                movie.Name = updatedMovie.Name ?? movie.Name;

                if (updatedMovie.ReleaseDate != default)
                {
                    movie.ReleaseDate = updatedMovie.ReleaseDate;
                }

                if (updatedMovie.GenreId != 0)
                {
                    movie.GenreId = updatedMovie.GenreId;
                    movie.Genre = await movieContext.Genres.FirstOrDefaultAsync(x => x.Id == updatedMovie.GenreId);
                }

                await movieContext.SaveChangesAsync();
                return Results.Ok(movie);
            });

            // DELETE /movies/{id} (Delete)
            group.MapDelete("/{id}", async (MovieContext movieContext, int id) =>
            {
                Movie? movie = await movieContext.Movies.FindAsync(id);
                if (movie is null) return Results.NotFound();

                movieContext.Movies.Remove(movie);
                await movieContext.SaveChangesAsync();
                return Results.NoContent();
            });


            return group;
        }
    }
}
