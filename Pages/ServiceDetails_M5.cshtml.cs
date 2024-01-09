using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;
using System.Net;
using System.Text;

namespace WebApplication1.Pages
{
    public class ServiceDetails_M5Model : PageModel
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
                foreach (var child in orders[0].children)
                {
                    ChildInformation childd = new ChildInformation();
                    childd.Age = int.Parse(child.cy_yas);
                    childd.Sex = child.cy_sex;
                    Children.Add(childd);
                }
            }
        }


        public class ChildInformation
        {
            public int Age { get; set; }
            public string Sex { get; set; }
        }
    }
}