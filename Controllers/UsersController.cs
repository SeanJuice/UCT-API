using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using API.Models;

namespace API.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class UsersController : ApiController
    {
        private UCTEntities db = new UCTEntities();
        [HttpGet]
        [Route("api/Users/getUserTypes")]
        public List<UserType> getUserTypes()
        {

            db.Configuration.ProxyCreationEnabled = false;
            List<object> list = new List<object>();
            try
            {
                List<UserType> types = db.UserTypes.ToList();
                return types;
            }
            catch (Exception)
            {
                return null;
            }

        }
        [HttpGet]
        [Route("api/Users/getUserTypes/{id}")]
        public List<Cours> getCourses(int id)
        {

            db.Configuration.ProxyCreationEnabled = false;
            List<object> list = new List<object>();
            try
            {
                List<Cours> types = db.Courses.Where(r => r.Usertype == id).ToList();
                return types;
            }
            catch (Exception)
            {
                return null;
            }

        }




    }
}