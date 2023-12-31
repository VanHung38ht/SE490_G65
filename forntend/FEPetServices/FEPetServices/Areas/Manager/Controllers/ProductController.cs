﻿using FEPetServices.Form;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Newtonsoft.Json;
using System.Net.Http.Headers;
using System.Text.Json;
using System.Text;
using Microsoft.AspNetCore.Authorization;

namespace FEPetServices.Areas.Manager.Controllers
{
    [Authorize(Policy = "ManaOnly")]
    public class ProductController : Controller
    {
        private readonly HttpClient client = null;
        private string DefaultApiUrl = "";
        private string DefaultApiUrlProductList = "";
        private string DefaultApiUrlProductDetail = "";
        private string DefaultApiUrlProductAdd = "";
        private string DefaultApiUrlProductUpdate = "";
        public ProductController()
        {
            client = new HttpClient();
            var contentType = new MediaTypeWithQualityHeaderValue("application/json");
            client.DefaultRequestHeaders.Accept.Add(contentType);
            DefaultApiUrl = "";
            DefaultApiUrlProductList = "https://localhost:7255/api/Product";
            DefaultApiUrlProductDetail = "https://localhost:7255/api/Product/ProductID";
            DefaultApiUrlProductAdd = "https://localhost:7255/api/Product/Add";
            DefaultApiUrlProductUpdate = "https://localhost:7255/api/Product/Update?proId=";
        }
        public async Task<IActionResult> Index(ProductDTO productDTO)
        {
            try
            {
                var json = JsonConvert.SerializeObject(productDTO);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                HttpResponseMessage response = await client.GetAsync(DefaultApiUrlProductList + "/GetAll");
                if (response.IsSuccessStatusCode)
                {
                    var rep = await response.Content.ReadAsStringAsync();
                    if (!string.IsNullOrEmpty(rep))
                    {
                        var productList = JsonConvert.DeserializeObject<List<ProductDTO>>(rep);
                        TempData["SuccessLoadingDataToast"] = "Lấy dữ liệu thành công";
                        return View(productList);
                    }
                    else
                    {
                        ViewBag.ErrorToast = "API trả về dữ liệu rỗng";
                    }
                }
                else
                {
                    ViewBag.ErrorToast = "Tải dữ liệu lên thất bại. Vui lòng tải lại trang!";
                }
                
            }
            catch (Exception ex)
            {
                ViewBag.ErrorToast = "Đã xảy ra lỗi: " + ex.Message;
            }
            return View();
        }
        public async Task<IActionResult> Add([FromForm] ProductDTO pro, IFormFile image)
        {
            try
            {
                HttpResponseMessage proCateResponse = await client.GetAsync("https://localhost:7255/api/ProductCategory/GetAll");
                if (proCateResponse.IsSuccessStatusCode)
                {
                    var proCategories = await proCateResponse.Content.ReadFromJsonAsync<List<ProductCategoryDTO>>();
                    ViewBag.ProCategories = new SelectList(proCategories, "ProCategoriesId", "ProCategoriesName");
                }
                if (ModelState.IsValid) // Kiểm tra xem biểu mẫu có hợp lệ không
                {
                    if (image != null && image.Length > 0)
                    {
                        // Xử lý và lưu trữ ảnh
                        Console.WriteLine(image);
                        pro.Picture = "/img/" + image.FileName.ToString();
                    }
                    var json = JsonConvert.SerializeObject(pro);
                    var content = new StringContent(json, Encoding.UTF8, "application/json");

                    // Gửi dữ liệu lên máy chủ
                    HttpResponseMessage response = await client.PostAsync(DefaultApiUrlProductAdd, content);

                    if (response.IsSuccessStatusCode)
                    {
                        TempData["SuccessToast"] = "Thêm sản phẩm thành công!";
                        return View(pro); // Chuyển hướng đến trang thành công hoặc trang danh sách
                    }
                    else
                    {
                        TempData["ErrorToast"] = "Thêm sản phẩm thất bại. Vui lòng thử lại sau.";
                        return View(pro); // Hiển thị lại biểu mẫu với dữ liệu đã điền
                    }
                }
                else
                {
                    return View(pro);
                }
            }
            catch (Exception ex)
            {
                TempData["ErrorToast"] = "Đã xảy ra lỗi: " + ex.Message;
                return View(pro); // Hiển thị lại biểu mẫu với dữ liệu đã điền
            }
        }
        [HttpGet]
        public async Task<IActionResult> Update(int proId, ProductDTO productDTO)
        {
            try
            {
                //goi api de lay thong tin can sua
                HttpResponseMessage response = await client.GetAsync(DefaultApiUrlProductDetail + "/" + proId);
                HttpResponseMessage proCateResponse = await client.GetAsync("https://localhost:7255/api/ProductCategory/GetAll");
                if (proCateResponse.IsSuccessStatusCode)
                {
                    var proCategories = await proCateResponse.Content.ReadFromJsonAsync<List<ProductCategoryDTO>>();
                    ViewBag.ProCategories = new SelectList(proCategories, "ProCategoriesId", "ProCategoriesName");
                }
                if (response.IsSuccessStatusCode)
                {
                    string responseContent = await response.Content.ReadAsStringAsync();

                    var options = new JsonSerializerOptions
                    {
                        PropertyNameCaseInsensitive = true
                    };

                    ProductDTO managerInfos = System.Text.Json.JsonSerializer.Deserialize<ProductDTO>(responseContent, options);

                    return View(managerInfos);

                }
                else
                {
                    TempData["ErrorToast"] = "Tải dữ liệu lên thất bại. Vui lòng tải lại trang.";
                }
                if (Request.Form["Status"] == "on")
                {
                    productDTO.Status = true;
                }
                else
                {
                    productDTO.Status = false;
                }
            }
            catch (Exception ex)
            {
                TempData["ErrorToast"] = "Đã xảy ra lỗi: " + ex.Message;
            }
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Update([FromForm] ProductDTO productDTO, IFormFile image, int proId, int SelectedCategory)
        {
            try
            {
                HttpResponseMessage proCateResponse = await client.GetAsync("https://localhost:7255/api/ProductCategory/GetAll");
                if (proCateResponse.IsSuccessStatusCode)
                {
                    var proCategories = await proCateResponse.Content.ReadFromJsonAsync<List<ProductCategoryDTO>>();
                    ViewBag.ProCategories = new SelectList(proCategories, "ProCategoriesId", "ProCategoriesName");
                }
                if (image != null && image.Length > 0)
                {
                    // Handle the case when a new image is uploaded
                    var imagePath = "/img/" + image.FileName;
                    productDTO.Picture = imagePath;

                    var physicalImagePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "img", image.FileName);
                    using (var stream = new FileStream(physicalImagePath, FileMode.Create))
                    {
                        await image.CopyToAsync(stream);
                    }
                }
                else
                {
                    // Handle the case when no new image is uploaded
                    HttpResponseMessage responseForImage = await client.GetAsync(DefaultApiUrlProductDetail + "/" + proId);

                    if (responseForImage.IsSuccessStatusCode)
                    {
                        var responseContent = await responseForImage.Content.ReadAsStringAsync();

                        if (!string.IsNullOrEmpty(responseContent))
                        {
                            var existingServiceCategory = JsonConvert.DeserializeObject<ProductDTO>(responseContent);
                            /*var existingServiceCategory = existingServiceCategoryList.FirstOrDefault();*/
                            if (existingServiceCategory != null)
                            {
                                // Assign the existing image path to service.Picture.
                                productDTO.Picture = existingServiceCategory.Picture;
                            }
                        }
                    }
                }

                if (Request.Form["Status"] == "on")
                {
                    productDTO.Status = true;
                }
                else
                {
                    productDTO.Status = false;
                }

                var json = JsonConvert.SerializeObject(productDTO);
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                HttpResponseMessage response = await client.PutAsync(DefaultApiUrlProductUpdate + proId, content);
                if (response.IsSuccessStatusCode)
                {
                    TempData["SuccessToast"] = "Chỉnh sửa sản phẩm thành công!";
                    return RedirectToAction("Update", new { proId = proId });
                }
                else
                {
                    TempData["ErrorToast"] = "Chỉnh sửa sản phẩm không thành công!";
                    return View(productDTO);
                }
            }
            catch (Exception ex)
            {
                TempData["ErrorToast"] = "Đã xảy ra lỗi: " + ex.Message;
                return View(productDTO);
            }
        }
    }
}
