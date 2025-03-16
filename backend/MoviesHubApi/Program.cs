using Microsoft.EntityFrameworkCore;
using MoviesHubApi.Data;
using MoviesHubApi.Endpoints;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext<MovieContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"))
);

builder.Services.AddCors(options =>
{
    options.AddPolicy(
        "AllowAll",
        policy => policy.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader()
    );
});

var app = builder.Build();

app.UseCors("AllowAll");

app.MapGet("/", () => Results.Ok("MoviesHub API is running"));

// Use MoviesEndpoints
app.MapMoviesEndpoints();

app.Run();
