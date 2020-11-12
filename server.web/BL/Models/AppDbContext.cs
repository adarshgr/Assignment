using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;


namespace server.web.BL.Models
{
    public static class AppDbContext
    {
        public static string dbConnectionString = "";

        public static SqlConnection getDbConnection()
        {
            return new SqlConnection(dbConnectionString);
        }
    }
}
