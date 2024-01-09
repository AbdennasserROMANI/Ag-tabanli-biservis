using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace WebApplication1.Models
{
    public class ServM1
    {
		[BindProperty]
		public IFormFile image { get; set; }

		[BindProperty]
		public String salonS { get; set; }

		[BindProperty]
		public String salonM { get; set; }

		[BindProperty]
		public String mutfakS { get; set; }

		[BindProperty]
		public String mutfakM { get; set; }

		[BindProperty]
		public String buroS { get; set; }

		[BindProperty]
		public String buroM { get; set; }

		[BindProperty]
		public String depoS { get; set; }

		[BindProperty]
		public String depoM { get; set; }

		[BindProperty]
		public String banyoS { get; set; }

		[BindProperty]
		public String banyoM { get; set; }

		[BindProperty]
		public String tuvaletS { get; set; }
		[BindProperty]
		public String tuvaletM { get; set; }

		[BindProperty]
		public String odaS { get; set; }
		[BindProperty]
		public String odaM { get; set; }

		[BindProperty]
		public String bahceS { get; set; }
		[BindProperty]
		public String bahceM { get; set; }

		[BindProperty]
		public String balkonS { get; set; }
		[BindProperty]
		public String balkonM { get; set; }

		[BindProperty]
		public String not { get; set; }

		[BindProperty]
		public String agacS { get; set; }

		[BindProperty]
		public String saatS { get; set; }

		[BindProperty]
		public String gunS { get; set; }

		[BindProperty]
		public String time { get; set; }

		[BindProperty]
		public String s_id { get; set; }

    }
}
