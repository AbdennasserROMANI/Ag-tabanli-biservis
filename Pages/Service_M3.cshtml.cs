using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.ComponentModel.DataAnnotations;
using System.Net;
using System.Text;
using System.Web;
using WebApplication1.Models;

namespace WebApplication1.Pages.ServicePages
{
    public class Service_M3Model : PageModel
    {
		public string msg { get; set; }
		[BindProperty, DisplayFormat(DataFormatString = "{0:yyyy-MM-ddTHH:mm}", ApplyFormatInEditMode = true)]
		public DateTime CurrentTime { get; set; } = DateTime.Now;
		public void OnPostSubmit(ServM1 servM1)
		{

			string apiUrl = $"https://romani-au.digital/APIs/BiServis/api/";

			using (WebClient client = new WebClient())
			{
				client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

				string date = DateTime.Now.ToString("dd/MM/yyyy");

				String imageString = "";

				if (servM1.image != null)
				{
					imageString = ConvertImageToBase64(servM1.image);
				}
				string encodedLongString = HttpUtility.UrlEncode(imageString);
				string postData = $"add_talep&salon_count=&salon_metresi=&mutfak_count=&mutfak_metresi=&buro_count=&buro_metresi=&depo_count=&depo_metresi=&banyo_count=&banyo_metresi=&tuvalet_count=&tuvalet_metresi=&oda_count=&oda_metresi=&bahce_count={servM1.bahceS}&bahca_metresi={servM1.bahceM}&balkon_count=&balkon_metresi=&agac_count={servM1.agacS}&sd_not={servM1.not}&saat_sayisi=&gun_sayisi=&order_date={date}&baslangic_tarihi={servM1.time}&cu_id={HttpContext.Session.GetString("TC")}&image={encodedLongString}&s_id={servM1.s_id}";

				byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);
				byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);
				string response = Encoding.UTF8.GetString(responseBytes);

				this.msg = response;
			}
		}
		public void OnGet()
		{

		}

		static string ConvertImageToBase64(IFormFile image)
		{
			try
			{
				using (MemoryStream ms = new MemoryStream())
				{
					image.CopyTo(ms);

					byte[] imageBytes = ms.ToArray();
					string base64String = Convert.ToBase64String(imageBytes);

					return base64String;
				}
			}
			catch (Exception ex)
			{
				Console.WriteLine($"Error converting image to base64: {ex.Message}");
				return null;
			}
		}
	}
}
