using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using System.Net;
using System.Text;
using WebApplication1.Models;
namespace WebApplication1.Pages
{
    public class loginModel : PageModel
    {
        public String msg { get; set; }
        public void OnPostSubmit(LoginModel login)
        {

            Boolean isCustomer;

            isCustomer = bool.Parse(login.isCustomer);

			string apiUrl = $"https://romani-au.digital/APIs/BiServis/api/";
            
            using (WebClient client = new WebClient())
            {
                client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

                string postData;

                postData = $"check_user&username={login.username}&password={login.password}";

                byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);

                byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);

                string response = Encoding.UTF8.GetString(responseBytes);


                getData data = JsonConvert.DeserializeObject<getData>(response);

                if (data != null)
                {

                    HttpContext.Session.SetString("Stat", data.Stat);
					HttpContext.Session.SetString("Cuname", data.Cuname);
					HttpContext.Session.SetString("CuTC", data.CuTC);
					HttpContext.Session.SetString("Wo_name", data.Wo_name);
					HttpContext.Session.SetString("WoTC", data.WoTC);
					HttpContext.Session.SetString("User_name", data.User_name);
					HttpContext.Session.SetString("email", login.username);
                    HttpContext.Session.SetString("WoBolum", data.WoBolum);
                    
                }

                if (data.Stat.Equals("0"))
                {
                    this.msg = "Your email or password is not valid. Please try again.";
                }
                else if (isCustomer && data.Stat.Contains('1'))
                {
                    Response.Redirect("/Musteri");
                }
                else if (!isCustomer && data.Stat.Contains("2"))
                {
                    Response.Redirect("/Calisan");
                }
                else
                {
                    this.msg = "Your email or password is not valid. Please try again.";
                }
            }
        }
        public void OnGet()
        {
        }
    }
}


class getData
{
    public string Stat { get; set; }
    public string Cuname { get; set; }
    public string CuTC { get; set; }
    public string Wo_name { get; set; }
    public string WoTC { get; set; }
    public string User_name { get; set; }
    public string WoBolum { get; set; }
}
