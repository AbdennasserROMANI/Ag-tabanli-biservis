using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using System.Net;
using System.Text;

namespace WebApplication1.Pages
{
    public class MusteriTeklifleriModel : PageModel
    {
        public string sd_id { get; set; }
        public string msg { get; set; }
        public void OnGet()
        {
            sd_id = (String)Request.Query["sd_id"];
            string apiUrl = $"https://romani-au.digital/APIs/BiServis/api/";

            sd_id = (String)Request.Query["sd_id"];

            using (WebClient client = new WebClient())
            {
                client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

                string postData = $"get_teklifler&talep_id={sd_id}";
                byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);
                byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);
                string response = Encoding.UTF8.GetString(responseBytes);
                //this.msg = response; 
                List<Talepler> taleplers = JsonConvert.DeserializeObject<List<Talepler>>(response);
                TempData["order"] = taleplers;

            }

        }

        public void OnPost()
        {
            string handler = Request.Form["handler"];
            string talep_id = Request.Form["sd_id"];
            string teklif_id = Request.Form["teklif_id"];

            string apiUrl = $"https://romani-au.digital/APIs/BiServis/api/";

            switch (handler)
            {
                case "kabul":

                    using (WebClient client = new WebClient())
                    {
                        client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

                        string postData = $"change_talep_stat&talep_id={talep_id}&teklif_stat=1&teklif_id={teklif_id}";
                        byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);
                        byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);
                        string response = Encoding.UTF8.GetString(responseBytes);
                        this.msg = response;
                        //List<Talepler> taleplers = JsonConvert.DeserializeObject<List<Talepler>>(response);
                        //TempData["order"] = taleplers;
                        Response.Redirect("/MusteriTeklifleri?sd_id="+ talep_id);
                    }
                    break;
                case "red":

                    using (WebClient client = new WebClient())
                    {
                        client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

                        string postData = $"change_talep_stat&talep_id={talep_id}&teklif_stat=-1&teklif_id={teklif_id}";
                        byte[] postDataBytes = Encoding.UTF8.GetBytes(postData);
                        byte[] responseBytes = client.UploadData(apiUrl, "POST", postDataBytes);
                        string response = Encoding.UTF8.GetString(responseBytes);
                        //List<Talepler> taleplers = JsonConvert.DeserializeObject<List<Talepler>>(response);
                        //TempData["order"] = taleplers;
                        Response.Redirect("/MusteriTeklifleri?sd_id=" + talep_id);
                    }
                    break;
                default:
                    break;
            }
        }

    }

    public class Talepler 
    {
        public string te_id { get; set; }
        public string te_fiyat { get; set; }
        public string te_date { get; set; }
        public string te_stat { get; set; }
        public string sd_id { get; set; }
        public string wo_name { get; set; }
        public string wo_tel { get; set; }
        public string wo_tecrube { get; set; }
        public string wo_id { get; set; }
    }

}
