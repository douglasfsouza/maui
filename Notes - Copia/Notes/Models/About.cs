using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.WebRequestMethods;

namespace Notes.Models
{
    public class About
    {
        public string Title { get; set; }
        public string Version { get; set; }
        public string Description { get; set; }
        public string Message { get; set; }
        public string PrivacyURL => "https://electrasystems.netlify.app/policy";

        public About()
        {
            Title = AppInfo.Name;
            Version= AppInfo.VersionString;
            Description = "App to include your notes";
            Message = "Enjoy this App";
        }
    }
}
