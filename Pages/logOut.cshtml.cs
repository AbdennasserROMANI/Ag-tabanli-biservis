using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace WebApplication1.Pages
{
    public class logOutModel : PageModel
    {
        public void OnGet()
        {
            HttpContext.Session.SetString("Stat", "");
            HttpContext.Session.SetString("Cuname", "");
            HttpContext.Session.SetString("CuTC", "");
            HttpContext.Session.SetString("Wo_name", "");
            HttpContext.Session.SetString("WoTC", "");
            HttpContext.Session.SetString("User_name", "");
            HttpContext.Session.SetString("email", "");
            HttpContext.Session.SetString("WoBolum", "");
            Response.Redirect("/index");
        }
    }
}
