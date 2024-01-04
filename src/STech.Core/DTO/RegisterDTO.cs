using System.ComponentModel.DataAnnotations;

namespace STech.Core.DTO;

public class RegisterDTO
{
    [Required]
    [EmailAddress]
    public string Email { get; set; }
    
    [Required]
    public string Username { get; set; }
    
    [Required] 
    public string FullName { get; set; }
    
    [Required]
    [DataType(DataType.Password)]
    public string Password { get; set; }
}