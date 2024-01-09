using Microsoft.AspNetCore.Mvc;

namespace WebApplication1.NewFolder
{
	public class CustomerModel
	{

		[BindProperty]
		public IFormFile image { get; set; }

		[BindProperty]
		public String name { get; set; }

		[BindProperty]
		public String tcnu { get; set; }

		[BindProperty]
		public String telephon { get; set; }

		[BindProperty]
		public String eposta { get; set; }

		[BindProperty]
		public String password { get; set; }

		[BindProperty]
		public String tkpassword { get; set; }

		[BindProperty]
		public String sehir { get; set; }

		[BindProperty]
		public String bolum { get; set; }

		[BindProperty]
		public String tecrube { get; set; }

		[BindProperty]
		public String not { get; set; }

		[BindProperty]
		public String ismusteri { get; set; }

		[BindProperty]
		public String adres { get; set; }

	}
}
