﻿using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PetServices.DTO;
using PetServices.Models;

namespace PetServices.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private PetServicesContext _context;
        private IMapper _mapper;
        private readonly IConfiguration _configuration;

        public ProductController(PetServicesContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
        }
        [HttpGet("GetAll")]
        public IActionResult GetAllProduct()
        {
            List<Product> products = _context.Products.Include(s => s.ProCategories)
                .ToList();
            return Ok(_mapper.Map<List<ProductDTO>>(products));
        }
        [HttpGet("ProductID/{id}")]
        public IActionResult GetById(int id)
        {
            Product product = _context.Products
                .Include(s => s.ProCategories)
                .FirstOrDefault(c => c.ProductId == id);
            return Ok(_mapper.Map<ProductDTO>(product));
        }
        [HttpPost("Add")]
        public async Task<IActionResult> CreateProduct(ProductDTO productDTO)
        {
            if (productDTO == null)
            {
                return BadRequest("Product data is missing.");
            }
            var product = new Product
            {
                ProductId = productDTO.ProductId,
                ProductName = productDTO.ProductName,
                Desciption = productDTO.Desciption,
                Picture = productDTO.Picture,
                Status = true,
                Price = productDTO.Price,
                Quantity = productDTO.Quanlity,
                CreateDate = DateTime.Now,
                ProCategoriesId = productDTO.ProCategoriesId
            };
            _context.Products.Add(product);
            try
            {
                await _context.SaveChangesAsync();
                return Ok(_mapper.Map<ProductDTO>(product));
            }
            catch (DbUpdateException ex)
            {
                return StatusCode(500, ex.InnerException.Message);
            }
        }
        [HttpPut("Update")]
        public async Task<IActionResult> Update(ProductDTO productDTO, int proId)
        {
            var product = _context.Products
                .Include(a => a.ProCategories)
                .FirstOrDefault(p => p.ProductId == proId);
            if (product == null)
            {
                return NotFound();
            }
            product.ProductName = productDTO.ProductName;
            product.Desciption = productDTO.Desciption;
            product.Picture = productDTO.Picture;
            product.Status = productDTO.Status;
            product.Price = productDTO.Price;
            product.Quantity = productDTO.Quanlity;
            product.CreateDate = DateTime.Now;
            product.ProCategoriesId = productDTO.ProCategoriesId;
            _context.Update(product);
            await _context.SaveChangesAsync();


            return Ok(product);
        }
    }
}