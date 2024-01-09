using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using System.Net;
using System.Text;

namespace WebApplication1.Pages
{
    public class oldOrdersModel : PageModel
    {
        public void OnGet()
        {
            string apiUrl = $"https://romani-au.digital/APIs/BiServis/api/";

            using (WebClient client = new WebClient())
            {
                client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

                string postData = $"get_old_talep&cu_id={HttpContext.Session.GetString("TC")}";
                byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);
                byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);
                string response = Encoding.UTF8.GetString(responseBytes);
                //this.msg = response;
                List<Orderss> orders = JsonConvert.DeserializeObject<List<Orderss>>(response);
                TempData["order"] = orders;
            }

        }

        public void OnPost()
        {
            string sd_id = Request.Form["sd_id"];
            string s_view_mode = Request.Form["s_view_mode"];

            Response.Redirect("/Fatura_" + s_view_mode + "?sd_id=" + sd_id);
              
        }

    }

    public class Orderss
    {
        public string sd_id { get; set; }
        public string salon_count { get; set; }
        public string salon_metresi { get; set; }
        public string mutfak_count { get; set; }
        public string mutfak_metresi { get; set; }
        public string buro_count { get; set; }
        public string buro_metresi { get; set; }
        public string depo_count { get; set; }
        public string depo_metresi { get; set; }
        public string banyo_count { get; set; }
        public string banyo_metresi { get; set; }
        public string tuvalet_count { get; set; }
        public string tuvalet_metresi { get; set; }
        public string oda_count { get; set; }
        public string oda_metresi { get; set; }
        public string bahce_count { get; set; }
        public string bahca_metresi { get; set; }
        public string balkon_count { get; set; }
        public string balkon_metresi { get; set; }
        public string agac_count { get; set; }
        public string sd_not { get; set; }
        public string saat_sayisi { get; set; }
        public string gun_sayisi { get; set; }
        public string order_date { get; set; }
        public string baslangic_tarihi { get; set; }
        public string cu_id { get; set; }
        public string image { get; set; }
        public string s_id { get; set; }
        public string sd_stat { get; set; }
        public string s_name { get; set; }
        public string s_logo { get; set; }
        public string s_view_mode { get; set; }
        public string address { get; set; }
        public string cu_name { get; set; }
        public string customer_id { get; set; }
        public string cu_addres { get; set; }
        public string wo_name { get; set; }
        public string wo_id { get; set; }
        public string wo_tel { get; set; }
        public string te_date { get; set; }
        public string te_fiyat { get; set; }
        public List<Children> children { get; set; }
    }

}
