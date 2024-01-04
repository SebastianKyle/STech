using System.Text.RegularExpressions;
using AutoMapper;
using STech.Core.Domain.Entities;
using STech.Core.Domain.Enums;
using STech.Core.DTO;

namespace STech.Core.Helpers;

public class MappingProfiles : Profile
{
    public MappingProfiles()
    {
        CreateMap<Product, ProductResponse>().ForMember(m => m.ProductID, o => o.MapFrom(s => s.ID))
            .ForMember(m => m.CategoryName, o => o.MapFrom(s => s.Category.Name))
            .ForMember(m => m.PictureUrls, o => o.MapFrom(s => s.ProductPictures.Select(p => p.Picture.Url).ToList()));

        CreateMap<CartItemDTO, CartItem>().ReverseMap();
        CreateMap<CustomerCartDTO, CustomerCart>().ReverseMap();
        
        CreateMap<Order, OrderResponseDTO>()
            .ForMember(m => m.ShippingPrice, o => o.MapFrom(s => s.DeliveryMethod.Price))
            .ForMember(m => m.DeliveryMethod, o => o.MapFrom(d => d.DeliveryMethod.Name))
            // .ForMember(m => m.OrderHistory, o => o.MapFrom(h => h.OrderHistories.OrderByDescending(o => o.ModifiedOn).FirstOrDefault()))
            .ForMember(m => m.OrderHistory, o => o.MapFrom<OrderHistoryResolver>())
            .ForMember(m => m.PlacedOn, o => o.MapFrom(o => o.PlacedOn.ToString("MM/dd/yyyy hh:mm:ss tt")))
            .ForMember(m => m.PaymentMethod, o => o.MapFrom(x => Regex.Replace(((PaymentMethod)x.PaymentMethod).ToString(), "(\\B[A-Z])", " $1")));
        CreateMap<OrderItem, OrderItemDTO>()
            .ForMember(m => m.ProductID, o => o.MapFrom(i => i.ProductID))
            .ForMember(m => m.ProductName, o => o.MapFrom(n => n.ProductName))
            .ForMember(m => m.PictureUrl, o => o.MapFrom(p => p.Product.ProductPictures.FirstOrDefault().Picture.Url))
            .ForMember(m => m.Price, o => o.MapFrom(x => x.ItemPrice));
        CreateMap<OrderHistory, OrderHistoryDTO>()
            .ForMember(m => m.ModifiedOn, o => o.MapFrom(m => m.ModifiedOn.ToString("MM/dd/yyyy hh:mm:ss tt")));
        CreateMap<OrderDTO, Order>()
            .ForMember(m => m.CustomerName, o => o.MapFrom(x => x.CustomerName))
            .ForMember(m => m.CustomerEmail, o => o.MapFrom(x => x.CustomerEmail))
            .ForMember(m => m.CustomerPhone, o => o.MapFrom(x => x.CustomerPhone))
            .ForMember(m => m.CustomerCountry, o => o.MapFrom(x => x.CustomerCountry))
            .ForMember(m => m.CustomerCity, o => o.MapFrom(x => x.CustomerCity))
            .ForMember(m => m.CustomerAddress, o => o.MapFrom(x => x.CustomerAddress))
            .ForMember(m => m.CustomerZipCode, o => o.MapFrom(x => x.CustomerZipCode))
            .ForMember(m => m.DeliveryMethodID, o => o.MapFrom(x => x.DeliveryMethodID))
            .ForMember(m => m.PaymentMethod, o => o.MapFrom(x => x.PaymentMethod));
        CreateMap<eCommerceUser, AddressDTO>()
            .ForMember(m => m.Country, o => o.MapFrom(u => u.Country))
            .ForMember(m => m.Address, o => o.MapFrom(u => u.Address))
            .ForMember(m => m.City, o => o.MapFrom(u => u.City))
            .ForMember(m => m.ZipCode, o => o.MapFrom(u => u.ZipCode));
        CreateMap<eCommerceUser, UserManagementDTO>()
            .ForMember(m => m.Id, o => o.MapFrom(u => u.Id))
            .ForMember(m => m.Roles, o => o.Ignore())
            .ForMember(m => m.UserName, o => o.MapFrom(u => u.UserName))
            .ForMember(m => m.FullName, o => o.MapFrom(u => u.FullName))
            .ForMember(m => m.Email, o => o.MapFrom(u => u.Email))
            .ForMember(m => m.RegisteredOn, o => o.MapFrom(u => u.RegisteredOn.ToString("MM/dd/yyyy hh:mm:ss tt")));
        CreateMap<eCommerceUser, UserDetailsDTO>()
            .ForMember(m => m.RegisteredOn, o => o.MapFrom(u => u.RegisteredOn.ToString("MM/dd/yyyy hh:mm:ss tt")));
        CreateMap<Comment, CommentResponseDTO>()
            .ForMember(m => m.CommentID, o => o.MapFrom(c => c.ID))
            .ForMember(m => m.Username, o => o.MapFrom(c => c.User.UserName))
            .ForMember(m => m.FullName, o => o.MapFrom(c => c.User.FullName))
            .ForMember(m => m.Timestamp, o => o.MapFrom(c => c.Timestamp.ToString("MM/dd/yyyy hh:mm:ss tt")))
            .ForMember(m => m.EntityID, o => o.MapFrom(c => c.EntityID))
            .ForMember(m => m.Text, o => o.MapFrom(c => c.Text))
            .ForMember(m => m.Rating, o => o.MapFrom(c => c.Rating));
        CreateMap<Comment, CommentWithProductDTO>()
            .ForMember(m => m.UserID, o => o.MapFrom(c => c.UserID))
            .ForMember(m => m.Username, o => o.MapFrom(c => c.User.UserName))
            .ForMember(m => m.FullName, o => o.MapFrom(c => c.User.FullName))
            .ForMember(m => m.Timestamp, o => o.MapFrom(c => c.Timestamp.ToString("MM/dd/yyyy hh:mm:ss tt")));
    } 
}