﻿using AutoMapper;
using PetServices.DTO;
using PetServices.Form;
using PetServices.Models;

namespace PetServices.Mapper
{
    public class Mapping : Profile
    {
        public Mapping()
        {
            #region Infomation
            CreateMap<UserInfo, UserInfoDTO>()
                .ReverseMap();

            CreateMap<PartnerInfo, PartnerInfoDTO>()
                .ReverseMap();

            CreateMap<PetInfo, PetInfoDTO>()
                .ReverseMap();

            CreateMap<PetInfo, PetInfoForm>()
                .ReverseMap();
            #endregion

            #region Booking
            CreateMap<Booking, BookingDTO>()
                .ReverseMap();

            #endregion

            #region Order
            CreateMap<Order, OrdersDTO>()
                .ReverseMap();

            CreateMap<OrderProductDetail, OrderProductDetailDTO>()
               .ReverseMap();
            #endregion

            #region Account
            CreateMap<Account, AccountInfo>()
                .ForMember(dest => dest.RoleName,
                    opt => opt.MapFrom(src => src.Role.RoleName))
                .ForMember(dest => dest.PartnerInfo,
                    opt => opt.MapFrom(src => src.PartnerInfo))
                .ReverseMap();

            CreateMap<Account, AccountDTO>()
                .ForMember(des => des.AccountId,
                            act => act.MapFrom(src => src.AccountId))
                .ForMember(des => des.Email,
                            act => act.MapFrom(src => src.Email))
                .ForMember(des => des.Password,
                            act => act.MapFrom(src => src.Password))
                .ForMember(des => des.Status,
                            act => act.MapFrom(src => src.Status))
                .ForMember(des => des.UserInfoId,
                            act => act.MapFrom(src => src.UserInfoId));
            #endregion

            CreateMap<ServiceCategory, ServiceCategoryDTO>()
                .ForMember(des => des.SerCategoriesId,
                            act => act.MapFrom(src => src.SerCategoriesId))
                .ForMember(des => des.SerCategoriesName,
                            act => act.MapFrom(src => src.SerCategoriesName))
                .ForMember(des => des.Desciptions,
                            act => act.MapFrom(src => src.Desciptions))
                .ForMember(des => des.Picture,
                            act => act.MapFrom(src => src.Picture));

            CreateMap<Service, ServiceDTO>()
                .ForMember(dest => dest.ServiceId, opt => opt.MapFrom(src => src.ServiceId))
                .ForMember(dest => dest.ServiceName, opt => opt.MapFrom(src => src.ServiceName))
                .ForMember(dest => dest.Desciptions, opt => opt.MapFrom(src => src.Desciptions))
                .ForMember(dest => dest.Picture, opt => opt.MapFrom(src => src.Picture))
                .ForMember(dest => dest.Price, opt => opt.MapFrom(src => src.Price))
                .ForMember(dest => dest.Status, opt => opt.MapFrom(src => src.Status))
                .ForMember(dest => dest.SerCategoriesId, opt => opt.MapFrom(src => src.SerCategoriesId))
                .ForMember(dest => dest.SerCategoriesName, opt => opt.MapFrom(src => src.SerCategories.SerCategoriesName));


            CreateMap<Account, AccountByAdminDTO>()
            .ForMember(dest => dest.Stt, opt => opt.Ignore())
            .ForMember(dest => dest.UserName, opt => opt.MapFrom(src =>
                        src.PartnerInfoId != null ? src.PartnerInfo.FirstName + " " + src.PartnerInfo.LastName :
                        (src.UserInfoId != null ? src.UserInfo.FirstName + " " + src.UserInfo.LastName : "Null")))
            .ForMember(dest => dest.Address, opt => opt.MapFrom(src =>
                        src.PartnerInfoId != null ? src.PartnerInfo.Province + ", " + src.PartnerInfo.District
                        + ", " + src.PartnerInfo.Commune + ", " + src.PartnerInfo.Address :
                        (src.UserInfoId != null ? src.UserInfo.Province + ", " + src.UserInfo.District
                        + ", " + src.UserInfo.Commune + ", " + src.UserInfo.Address : "Null")));

            CreateMap<Account,UpdateAccountDTO >()
                .ForMember(des => des.Email,
                            act => act.MapFrom(src => src.Email))
                .ForMember(des => des.RoleId,
                            act => act.MapFrom(src => src.RoleId))
                .ForMember(des => des.Status,
                            act => act.MapFrom(src => src.Status));

            CreateMap<RoomCategory, RoomCategoryDTO>()
                .ReverseMap();

            CreateMap<Room, RoomDTO>()
                .ForMember(dest => dest.RoomCategoriesName, opt => opt.MapFrom(src => src.RoomCategories.RoomCategoriesName))
                .ReverseMap();

            CreateMap<Product, ProductDTO>()
                .ForMember(dest => dest.ProductId, opt => opt.MapFrom(src => src.ProductId))
                .ForMember(dest => dest.ProductName, opt => opt.MapFrom(src => src.ProductName))
                .ForMember(dest => dest.Desciption, opt => opt.MapFrom(src => src.Desciption))
                .ForMember(dest => dest.Picture, opt => opt.MapFrom(src => src.Picture))
                .ForMember(dest => dest.Status, opt => opt.MapFrom(src => src.Status))
                .ForMember(dest => dest.Price, opt => opt.MapFrom(src => src.Price))
                .ForMember(dest => dest.CreateDate, opt => opt.MapFrom(src => src.CreateDate))
                .ForMember(dest => dest.Quantity, opt => opt.MapFrom(src => src.Quantity))
                .ForMember(dest => dest.ProCategoriesId, opt => opt.MapFrom(src => src.ProCategoriesId))
                .ForMember(dest => dest.ProCategoriesName, opt => opt.MapFrom(src => src.ProCategories.ProCategoriesName));

            CreateMap<ProductCategory, ProductCategoryDTO>()
                .ForMember(dest => dest.ProCategoriesId, opt => opt.MapFrom(src => src.ProCategoriesId))
                .ForMember(dest => dest.ProCategoriesName, opt => opt.MapFrom(src => src.ProCategoriesName))
                .ForMember(dest => dest.Desciptions, opt => opt.MapFrom(src => src.Desciptions))
                .ForMember(dest => dest.Status, opt => opt.MapFrom(src => src.Status))
                .ForMember(dest => dest.Picture, opt => opt.MapFrom(src => src.Picture));
            CreateMap<Blog, BlogDTO>()
                .ForMember(dest => dest.BlogId, opt => opt.MapFrom(src => src.BlogId))
                .ForMember(dest => dest.PageTile, opt => opt.MapFrom(src => src.PageTile))
                .ForMember(dest => dest.Heading, opt => opt.MapFrom(src => src.Heading))
                .ForMember(dest => dest.PublisheDate, opt => opt.MapFrom(src => src.PublisheDate))
                .ForMember(dest => dest.Content, opt => opt.MapFrom(src => src.Content))
                .ForMember(dest => dest.Description, opt => opt.MapFrom(src => src.Description))
                .ForMember(dest => dest.ImageUrl, opt => opt.MapFrom(src => src.ImageUrl));
        }
    }
}
