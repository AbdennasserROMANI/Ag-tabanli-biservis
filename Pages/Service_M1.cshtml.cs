using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.ComponentModel.DataAnnotations;
using System.Net;
using System.Text;
using System.Web;
using WebApplication1.Models;
using WebApplication1.NewFolder;
using static System.Net.Mime.MediaTypeNames;

namespace WebApplication1.Pages.ServicePages
{
    public class Service_M1Model : PageModel
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
				string postData = $"add_talep&salon_count={servM1.salonS}&salon_metresi={servM1.salonM}&mutfak_count={servM1.mutfakS}&mutfak_metresi={servM1.mutfakM}&buro_count={servM1.buroS}&buro_metresi={servM1.buroM}&depo_count={servM1.depoS}&depo_metresi={servM1.depoM}&banyo_count={servM1.banyoS}&banyo_metresi={servM1.banyoM}&tuvalet_count={servM1.tuvaletS}&tuvalet_metresi={servM1.tuvaletM}&oda_count={servM1.odaS}&oda_metresi={servM1.odaM}&bahce_count={servM1.bahceS}&bahca_metresi={servM1.bahceM}&balkon_count={servM1.balkonS}&balkon_metresi={servM1.balkonM}&agac_count={servM1.agacS}&sd_not={servM1.not}&saat_sayisi={servM1.saatS}&gun_sayisi={servM1.gunS}&order_date={date}&baslangic_tarihi={servM1.time}&cu_id={HttpContext.Session.GetString("TC")}&image={encodedLongString}&s_id={servM1.s_id}";

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
