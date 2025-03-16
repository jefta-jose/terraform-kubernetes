﻿using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;

namespace MoviesHubApi.Entities
{
    public class Movie
    {
        public int Id { get; set; }
        
        [Required]
        [StringLength(50)]
        public required string Name {  get; set; }

        [Required]
        [Range(1, 200)]
        public decimal Price { get; set; }

        public DateOnly ReleaseDate {  get; set; }

        //Foreign Id
        public required int GenreId { get; set; }
        // Navigation Property
        [ValidateNever]
        public Genre? Genre { get; set; }
    }
}
