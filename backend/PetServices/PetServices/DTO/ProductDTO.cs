﻿namespace PetServices.DTO
{
    public class ProductDTO
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string Desciption { get; set; }
        public string Picture { get; set; }
        public bool? Status { get; set; }
        public double Price { get; set; }
        public DateTime? CreateDate { get; set; }
        public int ProCategoriesId { get; set; }
        public string? ProCategoriesName { get; set; }
        public int Quantity { get; set; }

    }
}
