using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using System.Net;
using System.Text;

namespace WebApplication1.Pages
{
    public class MusteriModel : PageModel
    {

        public string msg { get; set; }
        public void OnGet()
        {

			HttpContext.Session.SetString("stat", "1");
			HttpContext.Session.SetString("name", HttpContext.Session.GetString("Cuname"));
			HttpContext.Session.SetString("TC", HttpContext.Session.GetString("CuTC"));


			string apiUrl = $"https://romani-au.digital/APIs/BiServis/api/";

            using (WebClient client = new WebClient())
            {
                client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

                string postData;

                postData = $"get_servis";

                byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);

                byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);

                string response = Encoding.UTF8.GetString(responseBytes);
                response = response.Replace("<pre>", "");
                response = response.Replace("<pre/>", "");
                 
                myData data = JsonConvert.DeserializeObject<myData>(response);

                //this.msg = data.stat;

                ViewData["servis"] = data.servis;
                //getData data = JsonConvert.DeserializeObject<getData>(response);
            }
            }
    }

    public class Servis
    {
        public string servis_id { get; set; }
        public string servis_name { get; set; }
        public string servis_logo { get; set; }
        public string servis_view_mode { get; set; }
    }

    public class myData
    {
        public string stat { get; set; }
        public string message { get; set; }
        public List<Servis> servis { get; set; }
    }
}

