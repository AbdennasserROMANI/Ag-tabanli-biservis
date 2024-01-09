using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using System.Net;
using System.Text;

namespace WebApplication1.Pages
{
    public class activeOrderWorkerModel : PageModel
    {
        public string msg { get; set; }
        public void OnGet()
        {
            
            string bolum = HttpContext.Session.GetString("WoBolum");

            string apiUrl = $"https://romani-au.digital/APIs/BiServis/api/";

            using (WebClient client = new WebClient())
            {
                client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

                string postData;

                postData = $"get_worker_service&bolum={bolum}&worker_id={HttpContext.Session.GetString("WoTC")}";

                byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);

                byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);

                string response = Encoding.UTF8.GetString(responseBytes); 
                response = response.Replace("<pre>", "");
                response = response.Replace("<pre/>", "");

                Data ordersList = JsonConvert.DeserializeObject<Data>(response);


                TempData["services"] = ordersList.orders;
            }
        }

        public void OnPost()
        {
            string handler = Request.Form["handler"];
            string sd_id = Request.Form["sd_id"];
            string s_view_mode = Request.Form["s_view_mode"];

            switch (handler)
            {
                case "Details":
                    Response.Redirect("/ServiceDetails_" + s_view_mode + "?sd_id=" + sd_id);
                    break;
                default:
                    break;
            }
        }

    }
   
}