using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using System.Net;
using System.Text;

namespace WebApplication1.Pages
{
    public class NotificationModel : PageModel
    {
		public string cu_id { get; set; }
		public string msg { get; set; }
		public void OnGet()
		{
			string apiUrl = $"https://romani-au.digital/APIs/BiServis/api/";

			cu_id = HttpContext.Session.GetString("TC");

			using (WebClient client = new WebClient())
			{
				client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";
				string postData = $"get_bildirim&cu_id={cu_id}";
				byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);
				byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);
				string response = Encoding.UTF8.GetString(responseBytes);
				//this.msg = response; 
				List<Notif> notifs = JsonConvert.DeserializeObject<List<Notif>>(response);
				TempData["notif"] = notifs;

			}

		}

		

	}

	public class Notif
	{
		public string sd_id { get; set; }
		public string order_date { get; set; }
		public string te_date { get; set; }
		public string te_fiyat { get; set; }
		public string wo_name { get; set; }
		public string wo_tecrube { get; set; }
		public string wo_id { get; set; }
        public string cu_stat { get; set; }
        public string wo_stat { get; set; }

    }

}