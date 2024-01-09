using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using System.Net;
using System.Text;
using System.Web;
using WebApplication1.Models;
using WebApplication1.NewFolder;

namespace WebApplication1.Pages
{
    public class editProfileModel : PageModel
    {

		public string msg { get; set; }
		public string witch { get; set; }
        public string NotificationMessage { get; set; }


        public void OnPostSubmit(CustomerModel customerModel)
		{
			if (!customerModel.password.Equals(customerModel.tkpassword))
			{
				this.msg = String.Format("password must be the same");
			}
			else
			{
				try { 

					string apiUrl = $"https://romani-au.digital/APIs/BiServis/api/";

					using (WebClient client = new WebClient())
					{
						client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";
						string postData;

						if (HttpContext.Session.GetString("stat").Equals("1"))
						{
							postData = $"edit_custumer&name={customerModel.name}&tcnu={customerModel.tcnu}&eposta={customerModel.eposta}&password={customerModel.password}&telephon={customerModel.telephon}&sehir={customerModel.sehir}&adres={customerModel.adres}";
						}
						else
						{
							String imageString = "";
							if (customerModel.image != null)
							{
								imageString = ConvertImageToBase64(customerModel.image);
							}
							else
							{
								imageString = "";
							}

							string encodedLongString = HttpUtility.UrlEncode(imageString);
							postData = $"edit_worker&name={customerModel.name}&tcnu={customerModel.tcnu}&eposta={customerModel.eposta}&password={customerModel.password}&telephon={customerModel.telephon}&sehir={customerModel.sehir}&adres={customerModel.adres}&image={encodedLongString}&bolum={customerModel.bolum}&tecrube={customerModel.tecrube}";
						}

						byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);
						byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);
						string response = Encoding.UTF8.GetString(responseBytes);


						List<Customer> myData = JsonConvert.DeserializeObject<List<Customer>>(response);

						TempData["mydata"] = myData;

						this.msg = response;
						//Response.Redirect("/editProfile"); 

						HttpContext.Session.SetString("name", myData[0].name);

						TempData["NotificationMessage"] = "Your profile has been updated successfully!";
						
						
					}
                }
				catch (Exception ex)
				{
                    Console.WriteLine(ex.Message);
					// Set an error message
					

					NotificationMessage = "An error occurred while updating your profile.";
                }

			}
		}
	public void OnGet()
	{

			string apiUrl = $"https://romani-au.digital/APIs/BiServis/api/";
		using (WebClient client = new WebClient())
		{
			string stat = HttpContext.Session.GetString("stat");
			client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";
			string postData;
			postData = $"get_user&witch={stat}&user_name={HttpContext.Session.GetString("email")}";
			byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);
			byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);
			string response = Encoding.UTF8.GetString(responseBytes);
			List<Customer> myData = JsonConvert.DeserializeObject<List<Customer>>(response);
			
			//this.msg = HttpContext.Session.GetString("stat");
			TempData["mydata"] = myData;
			TempData["NotificationMessage"] = null;

			}
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
	public class Customer
	{
		public string tc { get; set; }
		public string name { get; set; }
		public string image { get; set; }
		public string posta { get; set; }
		public string tel { get; set; }
		public string city { get; set; }
		public string addres { get; set; }
		public string bolum { get; set; }
		public string tecrube { get; set; }
		public string password { get; set; }


	}



}
