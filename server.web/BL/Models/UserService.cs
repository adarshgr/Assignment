using server.DAL;
using server.DAL.Entities;
using server.web.BL.Models;
using server.web.BL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using AutoMapper;
using Dapper.Contrib;
using Dapper.Contrib.Extensions;

namespace server.web.BL
{
    public class UserService : IUserService
    {


        public UserDetailVieModel CreateOfficialEmail(UserDetailVieModel vm)
        {
            try
            {
                var lst =  GetAll().Where(x => x.Name.ToLower() == vm.Name.ToLower() && x.Id != vm.Id).ToList();
                if (lst != null &&  lst.Count()>0)
                {
                    var cnt = lst.Count();
                    vm.EmailOfficial = vm.Name.ToLower() + cnt + "@locusnine.com";
                }
                else
                {
                    vm.EmailOfficial = vm.Name.ToLower() + "@locusnine.com";
                }
                return vm;
            }
            catch (Exception ex)
            {
                return vm;
            }

        }
         public  List<UserDetailVieModel> GetAll()
        {
            var sql = "select * from UserDetails";
            var list = new List<UserDetailVieModel>();          
            using ( var db = AppDbContext.getDbConnection())
            {
                db.Open();
                list = db.Query<UserDetailVieModel>(sql).ToList();              
            }
            return list;
        }

        public bool Save(UserDetailVieModel vm)
        {
            using (var db = AppDbContext.getDbConnection())
            {
                try
                {

                    db.Open();

                    var config = new MapperConfiguration(cfg => cfg.CreateMap<UserDetailVieModel, UserDetail>());
                    var mapper = new Mapper(config);
                    UserDetail dto = mapper.Map<UserDetail>(vm);

                    var res = GetById(dto.Id);
                    if (res != null)
                    {
                       if(res.Name != dto.Name)
                        {
                            var obj = CreateOfficialEmail(vm);
                            dto.EmailOfficial = obj.EmailOfficial;
                        }
                        db.Update(dto);
                    }
                    else
                    {
                        var obj = CreateOfficialEmail(vm);
                        dto.EmailOfficial = obj.EmailOfficial;
                        db.Insert(dto);
                    }



                    return true;

                }
                catch (Exception ex)
                {
                    return false;
                }
                finally
                {
                    db.Close();
                }
            }

        }

        public UserDetailVieModel GetById(int id)
        {
            using (var db = AppDbContext.getDbConnection())
            {
                try
                {

                    db.Open();

                    var user = new UserDetailVieModel();
                    user = db.Query<UserDetailVieModel>(@"select * from UserDetails where Id=@id", new { id = id }).FirstOrDefault();
                    return user;

                }
                catch (Exception ex)
                {
                    return null;
                }
                finally
                {
                    db.Close();
                }
            }
        }

        public bool Delete(UserDetailVieModel vm)
        {
            throw new NotImplementedException();
        }
    }
}
