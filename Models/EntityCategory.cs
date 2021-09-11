using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CitySeva.Models
{
    public class EntityCategory
    {
        public int categoryId { get; set; }
        public string catgory_name { get; set; }
        public string description { get; set; }
        public bool is_active { get; set; }
    }
}