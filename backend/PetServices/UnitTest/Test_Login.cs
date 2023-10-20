﻿using System;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Moq;
using PetServices.Controllers;
using PetServices.DTO;
using PetServices.Form;
using PetServices.Models;
using Xunit;

namespace UnitTest
{
    public class Test_Login
    {
        [Fact]
        // 1. đúng email và password
        public async Task Test_Login_Success()
        {
            var options = new DbContextOptionsBuilder<PetServicesContext>()
                .UseInMemoryDatabase(databaseName: Guid.NewGuid().ToString())
                .Options;

            using (var context = new PetServicesContext(options))
            {
                var testUser = new Account
                {
                    Email = "hungnvhe153434@fpt.edu.vn",
                    Password = "12345678",
                    Role = new Role { RoleName = "CUSTOMER" }
                };

                context.Accounts.Add(testUser);
                context.SaveChanges();
            }

            var mockMapper = new Mock<IMapper>();
            var mockConfiguration = new Mock<IConfiguration>();

            mockConfiguration.Setup(x => x["Jwt:Key"]).Returns("Imsdg2wmP9DigIlxBV8czvXOa7XB442TBtioyAsVo5JEVCuOteFIGGJeo4nz4wa");
            mockConfiguration.Setup(x => x["Jwt:Issuer"]).Returns("http://project");
            mockConfiguration.Setup(x => x["Jwt:Audience"]).Returns("http://localhost5xxx");
            mockConfiguration.Setup(x => x["Jwt:ExpiryInDays"]).Returns("1");

            var controller = new AccountController(new PetServicesContext(options), mockMapper.Object, mockConfiguration.Object);

            var loginForm = new LoginForm
            {
                Email = "hungnvhe153434@fpt.edu.vn",
                Password = "12345678"
            };

            var result = await controller.Login(loginForm) as ObjectResult;

            Assert.NotNull(result);
            Assert.Equal(200, result.StatusCode);

            var loginResponse = result.Value as LoginResponse;
            Assert.NotNull(loginResponse);
            Assert.True(loginResponse.Successful);
            Assert.NotEmpty(loginResponse.Token);
        }

         [Fact]
        // 2. đúng email và sai password
        public async Task Test_Login_Fail_wrongPassword()
        {
            var options = new DbContextOptionsBuilder<PetServicesContext>()
                .UseInMemoryDatabase(databaseName: Guid.NewGuid().ToString())
                .Options;

            using (var context = new PetServicesContext(options))
            {
                var testUser = new Account
                {
                    Email = "hungnvhe153434@fpt.edu.vn",
                    Password = "12345678",
                    Role = new Role { RoleName = "CUSTOMER" }
                };

                context.Accounts.Add(testUser);
                context.SaveChanges();
            }

            var mockMapper = new Mock<IMapper>();
            var mockConfiguration = new Mock<IConfiguration>();

            mockConfiguration.Setup(x => x["Jwt:Key"]).Returns("Imsdg2wmP9DigIlxBV8czvXOa7XB442TBtioyAsVo5JEVCuOteFIGGJeo4nz4wa");
            mockConfiguration.Setup(x => x["Jwt:Issuer"]).Returns("http://project");
            mockConfiguration.Setup(x => x["Jwt:Audience"]).Returns("http://localhost5xxx");
            mockConfiguration.Setup(x => x["Jwt:ExpiryInDays"]).Returns("1");

            var controller = new AccountController(new PetServicesContext(options), mockMapper.Object, mockConfiguration.Object);

            var loginForm = new LoginForm
            {
                Email = "hungnvhe153434@fpt.edu.vn",
                Password = "12345611aa"
            };

            var result = await controller.Login(loginForm) as ObjectResult;

            Assert.NotNull(result);
            Assert.Equal(400, result.StatusCode);
            Assert.Equal("Đăng nhập không hợp lệ.", result.Value);
        }

        [Fact]
        // 3. đúng email và pass rỗng
        public async Task Test_Login_Fail_PasswordIsEmpty()
        {
            var options = new DbContextOptionsBuilder<PetServicesContext>()
                .UseInMemoryDatabase(databaseName: Guid.NewGuid().ToString())
                .Options;

            using (var context = new PetServicesContext(options))
            {
                var testUser = new Account
                {
                    Email = "hungnvhe153434@fpt.edu.vn",
                    Password = "12345678",
                    Role = new Role { RoleName = "CUSTOMER" }
                };

                context.Accounts.Add(testUser);
                context.SaveChanges();
            }

            var mockMapper = new Mock<IMapper>();
            var mockConfiguration = new Mock<IConfiguration>();

            mockConfiguration.Setup(x => x["Jwt:Key"]).Returns("Imsdg2wmP9DigIlxBV8czvXOa7XB442TBtioyAsVo5JEVCuOteFIGGJeo4nz4wa");
            mockConfiguration.Setup(x => x["Jwt:Issuer"]).Returns("http://project");
            mockConfiguration.Setup(x => x["Jwt:Audience"]).Returns("http://localhost5xxx");
            mockConfiguration.Setup(x => x["Jwt:ExpiryInDays"]).Returns("1");

            var controller = new AccountController(new PetServicesContext(options), mockMapper.Object, mockConfiguration.Object);

            var loginForm = new LoginForm
            {
                Email = "hungnvhe153434@fpt.edu.vn",
                Password = "" 
            };

            // Act
            var result = await controller.Login(loginForm) as ObjectResult;

            // Assert
            Assert.NotNull(result);
            Assert.Equal(400, result.StatusCode);
            Assert.Equal("Mật khẩu không được để trống!", result.Value);
        }

        [Fact]
        // 4. đúng email và pass không đủ 8 ký tự
        public async Task Test_Login_Fail_PasswordTooShort()
        {
            var options = new DbContextOptionsBuilder<PetServicesContext>()
                .UseInMemoryDatabase(databaseName: Guid.NewGuid().ToString())
                .Options;

            using (var context = new PetServicesContext(options))
            {
                var testUser = new Account
                {
                    Email = "hungnvhe153434@fpt.edu.vn",
                    Password = "12345678",
                    Role = new Role { RoleName = "CUSTOMER" }
                };

                context.Accounts.Add(testUser);
                context.SaveChanges();
            }

            var mockMapper = new Mock<IMapper>();
            var mockConfiguration = new Mock<IConfiguration>();

            mockConfiguration.Setup(x => x["Jwt:Key"]).Returns("Imsdg2wmP9DigIlxBV8czvXOa7XB442TBtioyAsVo5JEVCuOteFIGGJeo4nz4wa");
            mockConfiguration.Setup(x => x["Jwt:Issuer"]).Returns("http://project");
            mockConfiguration.Setup(x => x["Jwt:Audience"]).Returns("http://localhost5xxx");
            mockConfiguration.Setup(x => x["Jwt:ExpiryInDays"]).Returns("1");

            var controller = new AccountController(new PetServicesContext(options), mockMapper.Object, mockConfiguration.Object);

            var loginForm = new LoginForm
            {
                Email = "hungnvhe153434@fpt.edu.vn",
                Password = "12345"
            };

            var result = await controller.Login(loginForm) as ObjectResult;

            Assert.NotNull(result);
            Assert.Equal(400, result.StatusCode);
            Assert.Equal("Mật khẩu phải có ít nhất 8 ký tự.", result.Value);
        }

        [Fact]
        // 5. đúng email và pass chứa khoảng trắng
        public async Task Test_Login_Fail_PasswordContainsWhitespace()
        {
            var options = new DbContextOptionsBuilder<PetServicesContext>()
                .UseInMemoryDatabase(databaseName: Guid.NewGuid().ToString())
                .Options;

            using (var context = new PetServicesContext(options))
            {
                var testUser = new Account
                {
                    Email = "hungnvhe153434@fpt.edu.vn",
                    Password = "12345678",
                    Role = new Role { RoleName = "CUSTOMER" }
                };

                context.Accounts.Add(testUser);
                context.SaveChanges();
            }

            var mockMapper = new Mock<IMapper>();
            var mockConfiguration = new Mock<IConfiguration>();

            mockConfiguration.Setup(x => x["Jwt:Key"]).Returns("Imsdg2wmP9DigIlxBV8czvXOa7XB442TBtioyAsVo5JEVCuOteFIGGJeo4nz4wa");
            mockConfiguration.Setup(x => x["Jwt:Issuer"]).Returns("http://project");
            mockConfiguration.Setup(x => x["Jwt:Audience"]).Returns("http://localhost5xxx");
            mockConfiguration.Setup(x => x["Jwt:ExpiryInDays"]).Returns("1");

            var controller = new AccountController(new PetServicesContext(options), mockMapper.Object, mockConfiguration.Object);

            var loginForm = new LoginForm
            {
                Email = "hungnvhe153434@fpt.edu.vn",
                Password = "1234 5678"
            };

            var result = await controller.Login(loginForm) as ObjectResult;

            Assert.NotNull(result);
            Assert.Equal(400, result.StatusCode);
            Assert.Equal("Mật khẩu không được chứa khoảng trắng.", result.Value);
        }

        [Fact]
        // 6. đúng email và pass chứa ký tự đặc biệt
        public async Task Test_Login_Fail_PasswordContainsSpecialCharacters()
        {
            var options = new DbContextOptionsBuilder<PetServicesContext>()
                .UseInMemoryDatabase(databaseName: Guid.NewGuid().ToString())
                .Options;

            using (var context = new PetServicesContext(options))
            {
                var testUser = new Account
                {
                    Email = "hungnvhe153434@fpt.edu.vn",
                    Password = "12345678",
                    Role = new Role { RoleName = "CUSTOMER" }
                };

                context.Accounts.Add(testUser);
                context.SaveChanges();
            }

            var mockMapper = new Mock<IMapper>();
            var mockConfiguration = new Mock<IConfiguration>();

            mockConfiguration.Setup(x => x["Jwt:Key"]).Returns("Imsdg2wmP9DigIlxBV8czvXOa7XB442TBtioyAsVo5JEVCuOteFIGGJeo4nz4wa");
            mockConfiguration.Setup(x => x["Jwt:Issuer"]).Returns("http://project");
            mockConfiguration.Setup(x => x["Jwt:Audience"]).Returns("http://localhost5xxx");
            mockConfiguration.Setup(x => x["Jwt:ExpiryInDays"]).Returns("1");

            var controller = new AccountController(new PetServicesContext(options), mockMapper.Object, mockConfiguration.Object);

            var loginForm = new LoginForm
            {
                Email = "hungnvhe153434@fpt.edu.vn",
                Password = "12345678@"
            };

            var result = await controller.Login(loginForm) as ObjectResult;

            Assert.NotNull(result);
            Assert.Equal(400, result.StatusCode);
            Assert.Equal("Mật khẩu không được chứa ký tự đặc biệt.", result.Value);
        }
    }
}