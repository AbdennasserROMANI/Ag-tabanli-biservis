using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;
using System.Net;
using System.Text;
using System.Web;
using WebApplication1.Models;

namespace WebApplication1.Pages
{
    public class editService_M4Model : PageModel
    {
        public string msg { get; set; }

        [BindProperty, DisplayFormat(DataFormatString = "{0:yyyy-MM-ddTHH:mm}", ApplyFormatInEditMode = true)]
        public DateTime CurrentTime { get; set; } = DateTime.Now;

        public string sd_id { get; set; }

        [BindProperty]
        public int NumberOfChildren { get; set; }

        [BindProperty]
        public List<ChildInformation> Children { get; set; }

        public void OnGet()
        {
            string apiUrl = $"https://romani-au.digital/APIs/BiServis/api/";

            sd_id = (String)Request.Query["sd_id"];

            using (WebClient client = new WebClient())
            {
                client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

                string postData = $"get_talep&talep_id={sd_id}";
                byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);
                byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);
                string response = Encoding.UTF8.GetString(responseBytes);
                List<Orders> orders = JsonConvert.DeserializeObject<List<Orders>>(response);
                CurrentTime = DateTime.Parse(orders[0].baslangic_tarihi);
                TempData["order"] = orders;
                NumberOfChildren = orders[0].children.Count;
                Children = new List<ChildInformation>();
                foreach (var child in orders[0].children) { 
                    ChildInformation childd = new ChildInformation();
                    childd.Age = int.Parse(child.cy_yas);
                    childd.Sex = child.cy_sex;
                    Children.Add(childd);
                }
            }
        }

        public IActionResult OnPost(ServM1 servM1)
        {

            string apiUrl = $"https://romani-au.digital/APIs/BiServis/api/";

            using (WebClient client = new WebClient())
            {
                client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

                string date = DateTime.Now.ToString("dd/MM/yyyy");

                String imageString = "";

                string childrenJson = JsonConvert.SerializeObject(Children);

                string encodedLongString = HttpUtility.UrlEncode(imageString);
                string postData = $"update_order&sd_id={servM1.s_id}&salon_count=&salon_metresi=&mutfak_count=&mutfak_metresi=&buro_count=&buro_metresi=&depo_count=&depo_metresi=&banyo_count=&banyo_metresi=&tuvalet_count=&tuvalet_metresi=&oda_count=&oda_metresi=&bahce_count=&bahca_metresi=&balkon_count=&balkon_metresi=&agac_count=&sd_not={servM1.not}&saat_sayisi={servM1.saatS}&gun_sayisi={servM1.gunS}&order_date={date}&baslangic_tarihi={servM1.time}&cu_id={HttpContext.Session.GetString("TC")}&image=&s_id={servM1.s_id}&CocukYasli={Uri.EscapeDataString(childrenJson)}";

                byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);
                byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);
                string response = Encoding.UTF8.GetString(responseBytes);
                List<Orders> orders = JsonConvert.DeserializeObject<List<Orders>>(response);
                CurrentTime = DateTime.Parse(orders[0].baslangic_tarihi);
                TempData["order"] = orders;
                Response.Redirect("/editService_M4?sd_id=" + servM1.s_id);

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
