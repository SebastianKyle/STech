using System.ComponentModel.DataAnnotations;
using STech.Core.Domain.Entities;

namespace STech.Core.DTO;

public class CommentDTO
{
    [Required]
    public int Rating { get; set; }
    
    [Required]
    public string Text { get; set; }
    
    [Required]
    public int EntityID { get; set; }
}

public class CommentResponseDTO
{
    public int CommentID { get; set; }
    public string Username { get; set; }
    public string FullName { get; set; }
    public int EntityID { get; set; }
    public string Timestamp { get; set; }
    public int Rating { get; set; }
    public string Text { get; set; }
}

public class CommentWithProductDTO
{
    public int ID { get; set; }
    public string UserID { get; set; }
    public string Username { get; set; }
    public string FullName { get; set; }
    public int EntityID { get; set; }
    public Product? Product { get; set; }
    public string Timestamp { get; set; }
    public int Rating { get; set; }
    public string Text { get; set; }
}