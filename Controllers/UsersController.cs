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
        //private UCTEntitiess db = new UCTEntitiess();

        // GET: api/Users
        //public List<User> GetUsers()
        //{

        //    db.Configuration.ProxyCreationEnabled = false;
        //    List<object> list = new List<object>();
        //    try
        //    {
        //        List<User> users = db.Users.ToList();
        //        return users;
        //    }
        //    catch (Exception)
        //    {
        //        return null;
        //    }

        //}
        //[HttpGet]
        //[Route("api/Users/getProfile/{id}")]
        //public object getProfile(int id)
        //{
        //    db.Configuration.ProxyCreationEnabled = false;
        //    dynamic ToReturn = new ExpandoObject();
        //    try
        //    {
        //        User user = db.Users.Where(zz => zz.User_ID == id).FirstOrDefault();

        //        if(user != null)
        //        {
        //            ToReturn.Name = user.FullName;
        //            ToReturn.Email = user.Email;
        //            Expirience exp = db.Expiriences.Where(zz => zz.Expirience_id == user.Exprience_id).FirstOrDefault();
        //            ToReturn.Experience = exp.Description;
        //            User trainer = user.Trainer_id != null ? db.Users.Where(zz => zz.User_ID == user.Trainer_id).FirstOrDefault() : null;
        //            ToReturn.Tainer = user.Trainer_id != null ? trainer.FullName : "No trainer assigned";
        //            return ToReturn;
        //        }
        //        else
        //        {
        //            return null;
        //        }

              
       
        //    }
        //    catch (Exception)
        //    {
        //        return null;
        //    }
        //}


        //// GET: api/Users/5
        //[ResponseType(typeof(User))]
        //public IHttpActionResult GetUser(int id)
        //{
        //    User user = db.Users.Find(id);
        //    if (user == null)
        //    {
        //        return NotFound();
        //    }

        //    return Ok(user);
        //}

        //// PUT: api/Users/5
        //[ResponseType(typeof(void))]
        //public IHttpActionResult PutUser(int id, User user)
        //{
            
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    if (id != user.User_ID)
        //    {
        //        return BadRequest();
        //    }

        //    db.Entry(user).State = EntityState.Modified;

        //    try
        //    {
        //        db.SaveChanges();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!UserExists(id))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return StatusCode(HttpStatusCode.NoContent);
        //}

        //// POST: api/Users
        //[ResponseType(typeof(User))]
        //public IHttpActionResult PostUser(User user)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    db.Users.Add(user);
        //    db.SaveChanges();

        //    return CreatedAtRoute("DefaultApi", new { id = user.User_ID }, user);
        //}

        //// DELETE: api/Users/5
        //[ResponseType(typeof(User))]
        //public IHttpActionResult DeleteUser(int id)
        //{
        //    User user = db.Users.Find(id);
        //    if (user == null)
        //    {
        //        return NotFound();
        //    }

        //    db.Users.Remove(user);
        //    db.SaveChanges();

        //    return Ok(user);
        //}

        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        db.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}

        //private bool UserExists(int id)
        //{
        //    return db.Users.Count(e => e.User_ID == id) > 0;
        //}


    }
}