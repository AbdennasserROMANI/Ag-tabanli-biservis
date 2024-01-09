using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace WebApplication1.Pages
{
    public class WitchLoginModel : PageModel
    {

    public string witch {  get; set; }
        public void OnGet()
        {
            this.witch = HttpContext.Session.GetString("Stat") as string;
        }
    }
}
