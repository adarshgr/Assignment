using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using server.DAL.Entities;
using server.DAL;
using server.web.BL.Models;
using Microsoft.AspNetCore.Cors;
using server.web.BL.Services;
using static server.web.BL.Models.Helper;

namespace server.web.Controllers
{
    [EnableCors("CORS")]
    [Route("api/[controller]")]
    [ApiController]
    public class UserDetailsController : ControllerBase
    {
        private readonly IUserService _service;
        public UserDetailsController(IUserService service)
        {
            _service = service;
        }

        // GET: api/UserDetails
        [Route("/api/user/getAll")]
        [HttpGet]
        public IActionResult GetUser(int pageNo, int perPage)
        {
            ResponseObject response = new ResponseObject();
            
            var res = _service.GetAll();
            response.Data = res.Skip((pageNo-1) * perPage).Take(perPage).ToList();
            response.Count = res.Count();            
            return Ok(response);
        }

        [Route("/api/user/getdetail")]
        [HttpGet]
        public IActionResult GetUserDetail(int Id)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                var userDetail = _service.GetById(Id);

                if (userDetail == null)
                {
                    return NotFound();
                }

                return Ok(userDetail);
            }
            catch (Exception ex)
            {
                return StatusCode(501, Id);
            }
        }

        [Route("/api/user/updatedetail")]
        [HttpPut]
        public IActionResult PutUserDetail(int id, UserDetailVieModel userDetail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != userDetail.Id)
            {
                return BadRequest();
            }
            _service.Save(userDetail);

            return CreatedAtAction("GetUserDetail", new { id = userDetail.Id }, userDetail);
        }

        [Route("/api/user/add")]
        [HttpPost]
        public IActionResult PostUserDetail(UserDetailVieModel userDetail)
        {
            try
            {
                userDetail.CreatedAt = System.DateTime.Now;
                userDetail.LastUpdatedAt = System.DateTime.Now;
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                _service.Save(userDetail);

                return CreatedAtAction("GetUserDetail", new { id = userDetail.Id }, userDetail);
            }
            catch (Exception ex)
            {
                return StatusCode(501, userDetail);
            }
        }

        //[Route("/api/user/delete")]
        //[HttpDelete("{id}")]
        //public IActionResult DeleteUserDetail(Guid id)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    var userDetail =  _context.UserDetail.Find(id);
        //    if (userDetail == null)
        //    {
        //        return NotFound();
        //    }

        //    _context.UserDetail.Remove(userDetail);
        //     _context.SaveChangesAsync();

        //    return Ok(userDetail);
        //}
        //[Route("/api/user/isnew")]
        //private bool UserDetailExists(Guid id)
        //{
        //    return _context.UserDetail.Any(e => e.Id == id);
        //}
    }
}