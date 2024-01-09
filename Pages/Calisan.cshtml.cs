using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using System.Net;
using System.Text;

namespace WebApplication1.Pages
{
    public class CalisanModel : PageModel
    {

        public string msg { get; set; }
		public void OnGet()
		{
			HttpContext.Session.SetString("stat", "2");
			HttpContext.Session.SetString("name", HttpContext.Session.GetString("Wo_name"));
			HttpContext.Session.SetString("TC", HttpContext.Session.GetString("WoTC"));
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

            string apiUrl = $"https://romani-au.digital/APIs/BiServis/api/";

            switch (handler)
            {
                case "Details":
                    Response.Redirect("/ServiceDetails_"+s_view_mode+"?sd_id=" + sd_id);
                    break;
                case "Teklifver":

                    string teklif = Request.Form["teklif"];

                    string date = DateTime.Now.ToString("dd/MM/yyyy");

                    using (WebClient client = new WebClient()) 
                    {
                        client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

                        string postData = $"teklif_ver&order_id={sd_id}&cu_id={HttpContext.Session.GetString("TC")}&teklif={teklif}&order_date={date}&bolum={HttpContext.Session.GetString("WoBolum")}";
                        byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);
                        byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);
                        string response = Encoding.UTF8.GetString(responseBytes);

                        Data ordersList = JsonConvert.DeserializeObject<Data>(response);

                        TempData["services"] = ordersList.orders;
                        //Response.Redirect("/Calisan");
                    }
                    break;
                default:
                    break;
            }
        }

    }
    public class Data
    {
        public string stat { get; set; }
        public List<Order> orders { get; set; }
    }

    public class Order
    {
        public string sd_id { get; set; }
        public DateTime baslangic_tarihi { get; set; }
        public string order_date { get; set; }
        public string cu_id { get; set; }
        public string cu_name { get; set; }
        public string cu_city { get; set; }
        public string cu_addres { get; set; }
        public string cu_tel { get; set; }
		public string s_view_mode { get; set; }
        public string te_fiyat { get; set; }
        public string te_date { get; set;}
        public string te_stat { get; set;}
    }
}
