﻿using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;

namespace FEPetServices.Controllers
{
    public class LogoutController : Controller
    {
        public IActionResult Index()
        {
            // Kiểm tra xem người dùng đã được xác thực (authenticated) hay chưa
            if (User.Identity.IsAuthenticated)
            {
                // Đăng xuất khỏi hệ thống
                HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);

                // Xóa thông tin phiên làm việc (session)
                HttpContext.Session.Clear();
            }

            // Chuyển hướng đến trang đăng nhập
            return RedirectToAction("Index", "Login");
        }
    }
}
