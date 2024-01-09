using ImageMagick;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.IO.Compression;
using System.Net;
using System.Text;
using System.Web;
using WebApplication1.Models;
using WebApplication1.NewFolder;

namespace WebApplication1.Pages
{
	public class MusteriOlModel : PageModel
	{

		static readonly HttpClient client = new HttpClient();

		private readonly ILogger<MusteriOlModel> _logger;

		public MusteriOlModel(ILogger<MusteriOlModel> logger)
		{
			_logger = logger;
		}

		public String msg { get; set; }

		public bool IsMusteri { get; set; }

		public void OnPostSubmit(CustomerModel customerModel)
		{
			if (!customerModel.password.Equals(customerModel.tkpassword))
			{
				this.msg = String.Format("password must be the same");
			}
			else
			{

				string apiUrl = $"https://romani-au.digital/APIs/BiServis/api/";

				using (WebClient client = new WebClient())
				{
					client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

					string postData;

					if (customerModel.ismusteri.Equals("musteri"))
					{
						postData = $"add_custumer&name={customerModel.name}&tcnu={customerModel.tcnu}&eposta={customerModel.eposta}&password={customerModel.password}&telephon={customerModel.telephon}&sehir={customerModel.sehir}&adres={customerModel.adres}";
					}
					else 
					{
						String imageString = ConvertImageToBase64(customerModel.image);
						string encodedLongString = HttpUtility.UrlEncode(imageString);
						postData = $"add_worker&name={customerModel.name}&tcnu={customerModel.tcnu}&eposta={customerModel.eposta}&password={customerModel.password}&telephon={customerModel.telephon}&sehir={customerModel.sehir}&adres={customerModel.adres}&image={encodedLongString}&bolum={customerModel.bolum}&tecrube={customerModel.tecrube}&not={customerModel.not}";
					}

					byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);

					byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);

					string response = Encoding.UTF8.GetString(responseBytes);

					List<CustumerSingInModel> stat = JsonConvert.DeserializeObject<List<CustumerSingInModel>>(response);

					//this.msg="ydcyadcgascv";//stat[0].status;
					if (customerModel.ismusteri.Equals("musteri"))
					{
						Response.Redirect("/MusteriOl?page=musteri");
					}
					else 
					{
						Response.Redirect("/MusteriOl?page=calisan");
					}
				}

				//String url = String.Format("https://romani-au.digital/APIs/BiServis/api/?add_custumer&name={0}&tcnu={1}&eposta={2}&password={3}&telephon={4}&adres={5}&image={6}"
				//, customerModel.name, customerModel.tcnu, customerModel.eposta, customerModel.password, customerModel.telephon, customerModel.adres, ReadFileAsUtf8AndConvertToBase64(imageString)).Replace(" ", "%20");

				//Uri uri = new Uri(url);
				//var task = client.GetAsync(uri);
				//HttpResponseMessage result = task.Result ;
				//List<Status> statuses = new List<Status>();
				//if (result.IsSuccessStatusCode)
				//{
				//	Task<string> readString = result.Content.ReadAsStringAsync();
				//	string jsonString = readString.Result;
				//	statuses = Status.FromJson(jsonString);
				//}

				//if (statuses[0].status.Equals("ok"))
				//{
				//	this.msg = url;
				//}
				//else 
				//{
				//	this.msg = String.Format("Ooops ! There is a problem");
				//}
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
					// Copy the content of the uploaded image to the memory stream
					image.CopyTo(ms);

					// Convert the image content to base64
					byte[] imageBytes = ms.ToArray();
					string base64String = Convert.ToBase64String(imageBytes);

					return base64String;
				}
			}
			catch (Exception ex)
			{
				// Handle exceptions, such as invalid file format or other errors
				Console.WriteLine($"Error converting image to base64: {ex.Message}");
				return null;
			}
		}



	}

}
