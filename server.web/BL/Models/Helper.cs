
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace server.web.BL.Models
{
    public class Helper
    {
        public class  ResponseObject
        {
           
            public List<UserDetailVieModel> Data { get; set; }
            public int Count { get; set; }
        }
    }
}
