using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using System.Net;
using System.Text;
using WebApplication1.Models;

namespace WebApplication1.Pages
{
    public class activeOrderModel : PageModel
    {

        public string msg { get; set; }
        public string tcno { get; set; }
        public void OnGet()
        {

            string apiUrl = $"https://romani-au.digital/APIs/BiServis/api/";
            try
            {
                tcno = HttpContext.Session.GetString("TC");
            }
            catch 
            { 
                Response.Redirect("/index");
            }

            using (WebClient client = new WebClient())
            {
                client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

                string postData = $"get_actif_talep&cu_id={tcno}";
                byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);
                byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);
                string response = Encoding.UTF8.GetString(responseBytes);
                //this.msg = response;
                List<Orders> orders = JsonConvert.DeserializeObject<List<Orders>>(response);
                TempData["order"] = orders;
            }

        }

        public void OnPost()
        {
            string handler = Request.Form["handler"];
            string sd_id = Request.Form["sd_id"];
            string s_id = Request.Form["s_id"];
            string s_view_mode = Request.Form["s_view_mode"];

            string apiUrl = $"https://romani-au.digital/APIs/BiServis/api/";

            switch (handler)
            {
                case "Teklifler":
                    Response.Redirect("/MusteriTeklifleri?sd_id="+sd_id);
                    break;
                case "sil":
                    
                    using (WebClient client = new WebClient())
                    {
                        client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

                        string postData = $"delet_order&order_id={sd_id}&cu_id={HttpContext.Session.GetString("TC")}";
                        byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);
                        byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);
                        string response = Encoding.UTF8.GetString(responseBytes);
                        
                        List<Orders> orders = JsonConvert.DeserializeObject<List<Orders>>(response);
                        TempData["order"] = orders;
                        Response.Redirect("/activeOrder");
                    }
                    break;
                case "iptal":

                    using (WebClient client = new WebClient())
                    {
                        client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";
                     
                        string postData = $"ChangeOrderStat&order_id={sd_id}&cu_id={HttpContext.Session.GetString("TC")}&stat=0";
                        byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);
                        byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);
                        string response = Encoding.UTF8.GetString(responseBytes);
                        List<Orders> orders = JsonConvert.DeserializeObject<List<Orders>>(response);
                        TempData["order"] = orders;
                        Response.Redirect("/activeOrder");
                    }
                    break;
                case "aktifEt":

                    using (WebClient client = new WebClient())
                    {
                        client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

                        string postData = $"ChangeOrderStat&order_id={sd_id}&cu_id={HttpContext.Session.GetString("TC")}&stat=1";
                        byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);
                        byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);
                        string response = Encoding.UTF8.GetString(responseBytes);
                        List<Orders> orders = JsonConvert.DeserializeObject<List<Orders>>(response);
                        TempData["order"] = orders;
                        Response.Redirect("/activeOrder");
                    }
                    break;
                case "guncel":
                    
                    Response.Redirect("/editService_"+s_view_mode+ "?sd_id="+sd_id);
                    break;
                case "bitti":
                    using (WebClient client = new WebClient())
                    {
                        client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

                        string postData = $"ChangeOrderStat&order_id={sd_id}&cu_id={HttpContext.Session.GetString("TC")}&stat=2";
                        byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);
                        byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);
                        string response = Encoding.UTF8.GetString(responseBytes);
                        List<Orders> orders = JsonConvert.DeserializeObject<List<Orders>>(response);
                        TempData["order"] = orders;
                        Response.Redirect("/activeOrder");
                    }
                    break;
                default: 
                    break;
            }
        }
        
    }

    public class Children
    {
        public string cy_yas { get; set; }
        public string cy_sex { get; set; }
    
    }
        public class Orders
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
        public string teklif_count { get; set; }
        public List<Children> children { get; set; }
    }
}
