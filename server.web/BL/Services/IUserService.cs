using server.web.BL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace server.web.BL.Services
{
    public interface IUserService
    {
        List<UserDetailVieModel> GetAll();

        bool Save(UserDetailVieModel vm);

        UserDetailVieModel GetById(int id);

        bool Delete(UserDetailVieModel vm);

      
    }
}
