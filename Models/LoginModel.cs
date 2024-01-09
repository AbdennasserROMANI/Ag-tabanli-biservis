using Microsoft.AspNetCore.Mvc;

namespace WebApplication1.Models
{
    public class LoginModel
    {
        [BindProperty]
        public String username { get; set; }

        [BindProperty]
        public String password { get; set; }
        [BindProperty]
        public String isCustomer { get; set; }

    }
}
