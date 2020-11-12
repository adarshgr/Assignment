using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper.Contrib.Extensions;

namespace server.DAL.Entities
{
    public class UserDetail
    {
        
        
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string EmailPersonal { get; set; }
        public string EmailOfficial { get; set; }
        public string MobileNo { get; set; }
        public string RoleType { get; set; }
        public string Status { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime LastUpdatedAt { get; set; }
    }
}
