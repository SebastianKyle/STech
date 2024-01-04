using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using STech.Core.Domain.Entities;

namespace STech.Infrastructure.Data;

public class eCommerceDbInitializer
{
    public static async Task SeedRoles(RoleManager<IdentityRole> roleManager)
    {
        List<IdentityRole> roles = new List<IdentityRole>();
        roles.Add(new IdentityRole() { Name = "Administrator" });
        roles.Add(new IdentityRole() { Name = "Employee" });
        roles.Add(new IdentityRole() { Name = "Customer" });

        foreach (IdentityRole role in roles)
        {
            if (!await roleManager.RoleExistsAsync(role.Name))
            {
                var result = await roleManager.CreateAsync(role);

                if (result.Succeeded)
                    continue;
            }
        }
    }

    public static async Task SeedUsers(UserManager<eCommerceUser> userManager)
    {
        // var usersManager = new UserManager<eCommerceUser>(usersStore);

        /* Admin account */
        eCommerceUser admin = new eCommerceUser();
        admin.Id = Guid.NewGuid().ToString();
        admin.FullName = "Admin";

        admin.Email = "adm_use@domain.com";
        admin.UserName = "adm_use";
        var password = "Adm_use123";

        admin.PhoneNumber = "(312)555-0690";
        admin.Country = "Adminsburg";
        admin.City = "Adminstria";
        admin.Address = "404 Block D, Adm Street";
        admin.ZipCode = "123456";

        admin.RegisteredOn = DateTime.Now;

        var user = await userManager.FindByEmailAsync(admin.Email);
        if (user == null)
        {
            var result = await userManager.CreateAsync(admin, password);

            if (result.Succeeded)
            {
                //add necessary roles to admin
                await userManager.AddToRoleAsync(admin, "Administrator");
                await userManager.AddToRoleAsync(admin, "Employee");
                await userManager.AddToRoleAsync(admin, "Customer");
            }
        }
        
        /* Employee account */
        eCommerceUser employee = new eCommerceUser();
        employee.Id = Guid.NewGuid().ToString();
        employee.FullName = "Employee";

        employee.Email = "emp_use@domain.com";
        employee.UserName = "emp_use";
        var passwordEmp = "Emp_use123";

        employee.PhoneNumber = "(312)666-0134";
        employee.Country = "Rostava";
        employee.City = "ParisSaint";
        employee.Address = "401 Block E, Emp Street";
        employee.ZipCode = "135793";

        employee.RegisteredOn = DateTime.Now;

        var userEmp = await userManager.FindByEmailAsync(employee.Email);
        if (userEmp == null)
        {
            var result = await userManager.CreateAsync(employee, passwordEmp);

            if (result.Succeeded)
            {
                //add necessary roles to employee
                await userManager.AddToRoleAsync(employee, "Employee");
                await userManager.AddToRoleAsync(employee, "Customer");
            }
        }
    }

    public static async Task SeedCategories(eCommerceContext context)
    {
        try
        {
            if (!context.Categories.Any())
            {
                Category uncategorized = new Category()
                {
                    Name = "Uncategorized",
                    Description = "Products that are not categorized - not arranged in any specific grouping.",
                    ModifiedOn = DateTime.Now
                };

                context.Categories.Add(uncategorized);
                await context.SaveChangesAsync();
            }
        }
        catch (Exception e)
        {
            // TODO: Use ILogger to log errors while seeding data
            // Console.WriteLine(e);
            throw;
        }
    }
}