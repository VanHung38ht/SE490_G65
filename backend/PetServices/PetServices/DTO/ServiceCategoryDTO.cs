﻿using PetServices.Models;

namespace PetServices.DTO
{
    public class ServiceCategoryDTO
    {
        public ServiceCategoryDTO() { }
        public int SerCategoriesId { get; set; }
        public string? SerCategoriesName { get; set; }
        public string? Desciptions { get; set; }
        public string? Picture { get; set; }
        public bool? Status { get; set; }
        public virtual ICollection<ServiceDTO>? Services { get; set; }
    }
}
