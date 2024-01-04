namespace STech.Core.DTO;

public class UserDTO
{
    public string Email { get; set; }
    public string Username { get; set; }
    public string Token { get; set; }
    public List<string> Roles { get; set; }
}

public class UserDetailsDTO
{
    public string Id { get; set; }
    public string Email { get; set; }
    public string UserName { get; set; }
    public string FullName { get; set; }
    public string PhoneNumber { get; set; }
    public string Country { get; set; }
    public string City { get; set; }
    public string Address { get; set; }
    public string ZipCode { get; set; }
    public string RegisteredOn { get; set; }
}

public class UserManagementDTO
{
    public string Id { get; set; }
    public string Email { get; set; }
    public string UserName { get; set; }
    public string FullName { get; set; }
    public List<string>? Roles { get; set; }
    public string RegisteredOn { get; set; }
}