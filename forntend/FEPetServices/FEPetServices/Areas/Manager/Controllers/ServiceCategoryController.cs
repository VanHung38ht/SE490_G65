﻿using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using PetServices.Models;
using System.Security.Claims;

namespace FEPetServices.Areas.Manager.Controllers
{
    /*[Authorize(Roles = "MANAGER")]*/
    public class ServiceCategoryController : Controller
    {
        private readonly HttpClient client = null;
        private string DefaultApiUrl = "";
        private string DefaultApiUrlServiceCategoryList = "";
        private string DefaultApiUrlServiceCategoryDetail = "";
        private string DefaultApiUrlServiceCategoryAdd = "";
        private string DefaultApiUrlServiceCategoryUpdate = "";

        public ServiceCategoryController()
        {
            client = new HttpClient();
            var contentType = new MediaTypeWithQualityHeaderValue("application/json");
            client.DefaultRequestHeaders.Accept.Add(contentType);
            DefaultApiUrl = "";
            DefaultApiUrlServiceCategoryList = "https://localhost:7255/api/ServiceCategory";
            DefaultApiUrlServiceCategoryDetail = "https://localhost:7255/api/ServiceCategory/ServiceCategorysID";
            DefaultApiUrlServiceCategoryAdd = "https://localhost:7255/api/ServiceCategory/AddServiceCategory";
            DefaultApiUrlServiceCategoryUpdate = "https://localhost:7255/api/ServiceCategory/EditServiceCategory?serCategoriesId=";

    }

        public async Task<IActionResult> Index(ServiceCategoryDTO serviceCategory)
        {
            try
            {
                var json = JsonConvert.SerializeObject(serviceCategory);
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                HttpResponseMessage response = await client.GetAsync(DefaultApiUrlServiceCategoryList + "/GetAllServiceCategory");
                if (response.IsSuccessStatusCode)
                {
                    var responseContent = await response.Content.ReadAsStringAsync();

                    if (!string.IsNullOrEmpty(responseContent))
                    {
                        var servicecategoryList = JsonConvert.DeserializeObject<List<ServiceCategoryDTO>>(responseContent);
                        return View(servicecategoryList);
                    }
                    else
                    {
                        ViewBag.ErrorMessage = "API trả về dữ liệu rỗng.";
                    }
                }
                else
                {
                    ViewBag.ErrorMessage = "Tải dữ liệu lên thất bại. Vui lòng tải lại trang.";
                }
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = "Đã xảy ra lỗi: " + ex.Message;
            }

            
            return View();
        }

        public async Task<IActionResult> AddServiceCategory([FromForm] ServiceCategoryDTO serviceCategory, IFormFile image)
        {
            try
            {
                if (ModelState.IsValid) // Kiểm tra xem biểu mẫu có hợp lệ không
                {
                    if (image != null && image.Length > 0)
                    {
                        // Xử lý và lưu trữ ảnh
                        Console.WriteLine(image);
                        serviceCategory.Prictue = "/img/" + image.FileName.ToString();
                    }

                    var json = JsonConvert.SerializeObject(serviceCategory);
                    var content = new StringContent(json, Encoding.UTF8, "application/json");

                    // Gửi dữ liệu lên máy chủ
                    HttpResponseMessage response = await client.PostAsync(DefaultApiUrlServiceCategoryAdd, content);

                    if (response.IsSuccessStatusCode)
                    {
                        TempData["SuccessMessage"] = "Thêm dịch vụ thành công!";
                        return View(serviceCategory); // Chuyển hướng đến trang thành công hoặc trang danh sách
                    }
                    else
                    {
                        ViewBag.ErrorMessage = "Thêm dịch vụ thất bại. Vui lòng thử lại sau.";
                        return View(serviceCategory); // Hiển thị lại biểu mẫu với dữ liệu đã điền
                    }
                }
                else
                {
                    return View(serviceCategory); 
                }
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = "Đã xảy ra lỗi: " + ex.Message;
                return View(serviceCategory); // Hiển thị lại biểu mẫu với dữ liệu đã điền
            }
        }



        [HttpGet]
        public async Task<IActionResult> EditServiceCategory(int serCategoriesId)
        {
            try
            {
                // Gọi API để lấy thông tin ServiceCategory cần chỉnh sửa
                HttpResponseMessage response = await client.GetAsync(DefaultApiUrlServiceCategoryDetail + "/" + serCategoriesId);

                if (response.IsSuccessStatusCode)
                {
                    var responseContent = await response.Content.ReadAsStringAsync();

                    if (!string.IsNullOrEmpty(responseContent))
                    {
                        // Deserialize dữ liệu từ API thành danh sách các đối tượng ServiceCategoryDTO
                        var existingServiceCategoryList = JsonConvert.DeserializeObject<List<ServiceCategoryDTO>>(responseContent);

                        // Lấy đối tượng cần chỉnh sửa từ danh sách (có thể là phần tử đầu tiên)
                        var existingServiceCategory = existingServiceCategoryList.FirstOrDefault();

                        return View(existingServiceCategory);
                    }
                    else
                    {
                        ViewBag.ErrorMessage = "API trả về dữ liệu rỗng.";
                    }
                }
                else
                {
                    ViewBag.ErrorMessage = "Tải dữ liệu lên thất bại. Vui lòng tải lại trang.";
                }
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = "Đã xảy ra lỗi: " + ex.Message;
            }

            // Return the view with or without an error message
            return View();
        }


        [HttpPost]
        public async Task<IActionResult> EditServiceCategory([FromForm] ServiceCategoryDTO serviceCategory, IFormFile image, int serCategoriesId)
        {
            try
            {

                if (ModelState.IsValid) // Kiểm tra xem biểu mẫu có hợp lệ không
                {

                    if (image != null && image.Length > 0)
                    {
                        // Xử lý và lưu trữ ảnh
                        Console.WriteLine(image);
                        serviceCategory.Prictue = "/img/" + image.FileName.ToString();
                    }

                    var json = JsonConvert.SerializeObject(serviceCategory);
                    var content = new StringContent(json, Encoding.UTF8, "application/json");

                    // Gửi dữ liệu lên máy chủ
                    HttpResponseMessage response = await client.PostAsync(DefaultApiUrlServiceCategoryUpdate+ serCategoriesId, content);

                    if (response.IsSuccessStatusCode)
                    {
                        TempData["SuccessMessage"] = "Thêm dịch vụ thành công!";
                        return View(serviceCategory); // Chuyển hướng đến trang thành công hoặc trang danh sách
                    }
                    else
                    {
                        ViewBag.ErrorMessage = "Thêm dịch vụ thất bại. Vui lòng thử lại sau.";
                        return View(serviceCategory); // Hiển thị lại biểu mẫu với dữ liệu đã điền
                    }
                }
                else
                {
                    return View(serviceCategory);
                }
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = "Đã xảy ra lỗi: " + ex.Message;
                return View(serviceCategory); // Hiển thị lại biểu mẫu với dữ liệu đã điền
            }
        }

    }
}
