using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;
using System.Net;
using System.Text;
using WebApplication1.Models;

namespace WebApplication1.Pages.ServicePages
{
    public class Service_M5Model : PageModel
    {
        [BindProperty, DisplayFormat(DataFormatString = "{0:yyyy-MM-ddTHH:mm}", ApplyFormatInEditMode = true)]
        public DateTime CurrentTime { get; set; } = DateTime.Now;
        public string msg { get; set; }

        [BindProperty]
        public int NumberOfChildren { get; set; }

        [BindProperty]
        public List<ChildInformation> Children { get; set; }

        public void OnGet()
        {
            // Initialize the list when the page is first loaded
            Children = new List<ChildInformation>();
        }

        public IActionResult OnPost(ServM1 servM1)
        {

            //this.msg = Children.Count.ToString();

            string apiUrl = $"https://romani-au.digital/APIs/BiServis/api/";

            using (WebClient client = new WebClient())
            {
                client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

                string date = DateTime.Now.ToString("dd/MM/yyyy");

                string childrenJson = JsonConvert.SerializeObject(Children);

                string postData = $"add_talep&salon_count=&salon_metresi=&mutfak_count=&mutfak_metresi=&buro_count=&buro_metresi=&depo_count=&depo_metresi=&banyo_count=&banyo_metresi=&tuvalet_count=&tuvalet_metresi=&oda_count=&oda_metresi=&bahce_count=&bahca_metresi=&balkon_count=&balkon_metresi=&agac_count=&sd_not={servM1.not}&saat_sayisi={servM1.saatS}&gun_sayisi={servM1.gunS}&order_date={date}&baslangic_tarihi={servM1.time}&cu_id={HttpContext.Session.GetString("TC")}&image=&s_id={servM1.s_id}&CocukYasli={Uri.EscapeDataString(childrenJson)}";
                byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);
                byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);
                string response = Encoding.UTF8.GetString(responseBytes);
                //this.msg = response;
            }
            return Page();
        }
        public class ChildInformation
        {
            public int Age { get; set; }
            public string Sex { get; set; }
        }
    }

}
