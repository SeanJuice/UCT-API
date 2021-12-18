using API.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
using System.Web.Http;
using System.Web.Http.Cors;
using System.IO;
using System.Data;
using System.Globalization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Configuration;
using System.Data.SqlClient;
using System.Runtime.Serialization;
using System.Net.Mail;
using System.Data.Entity.Infrastructure;

namespace API.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class AccessController : ApiController
    {
        UCTEntities db = new UCTEntities();

        public static string ApplySomeSalt(string input)
        {
            try
            {
                return "4dfgdfgdfg5gd5451gdfg8d1gdfg1d" + input + "156g56341dgdf186591g6d";
            }
            catch
            {
                string err = "ApplySomeSalt() failed.";
                return (err);
            }
        }
        public static string GenerateHash(string Inputstring)
        {
            try
            {
                SHA256 sha256 = SHA256Managed.Create();
                byte[] bytes = Encoding.UTF8.GetBytes(Inputstring);
                byte[] hash = sha256.ComputeHash(bytes);
                return GetStringFromHash(hash);
            }
            catch
            {
                return null;
            }
        }
        private static string GetStringFromHash(byte[] hash)
        {
            try
            {
                StringBuilder result = new StringBuilder();
                for (int i = 0; i < hash.Length; i++)
                {
                    result.Append(hash[i].ToString("X2"));
                }
                return result.ToString();
            }
            catch
            {
                return null;
            }
        }

        [Route("api/Access/Register/{userroleid}")]
        [HttpPost]
        public dynamic Register([FromBody] User user, int userroleid)
        {
            db.Configuration.ProxyCreationEnabled = false;
            User usr = new User();
            try
            {
                var hash = GenerateHash(ApplySomeSalt(user.Password));
                usr.Username = user.Username;
                if (userroleid == 555) //Admin
                {
                    UserRole RoleUpdate = new UserRole();

                    UserRole role = db.UserRoles.Where(x => x.name == "Administrator").FirstOrDefault();
                    usr.UserRole_ID = role.id;

                }

                usr.UserRole_ID = 2;
                usr.Password = hash;
                usr.Email = user.Email;
                usr.Username = user.Username;
                usr.FirstName = user.FirstName;
                usr.Surname = user.Surname;
                usr.isAtSchool = user.isAtSchool;
                usr.SchoolName = user.SchoolName;

                db.Users.Add(usr);
                db.SaveChanges();

                return usr;
            }
            catch (Exception e)
            {
                return e;
            }
        }
        [Route("api/Access/Login")]
        [HttpPost] //Eventually we need to check if the user is active or registered before logging in 
        public object Login([FromBody] User usr)
        {
            db.Configuration.ProxyCreationEnabled = false;

            try
            {
                var hash = GenerateHash(ApplySomeSalt(usr.Password));
                int otp = Convert.ToInt32(usr.Password);
                User user = db.Users.Where(zz => zz.Email == usr.Email && zz.Password == hash).FirstOrDefault();

                dynamic ToReturn = new ExpandoObject();
                if (user != null)
                {
                    ToReturn.User_ID = user.id;
                    ToReturn.Username = user.Username;
                    ToReturn.Email = user.Email;
                    ToReturn.FirstName = user.FirstName;
                    ToReturn.Surname = user.Surname;

                    ToReturn.role = user.UserRole_ID;

                    return ToReturn;
                }
                else
                {
                    return null;
                }

            }
            catch
            {
                return null;
            }
        }
        [HttpGet]
        [Route("api/Access/getUserRoles/")]
        public object GetUserRole()
        {
            db.Configuration.ProxyCreationEnabled = false;
            dynamic results = new ExpandoObject();
            try
            {
                List<UserRole> userroles = db.UserRoles.ToList();

                results = userroles;
                return results;
            }
            catch (Exception)
            {
                return null;
            }
        }
        //[Route("api/Access/SubmitReview/{id}")]
        //[HttpPost] //Eventually we need to check if the user is active or registered before logging in 
        //public object SubmitReview([FromBody] Review review, int id)
        //{
        //    db.Configuration.ProxyCreationEnabled = false;

        //    try
        //    {
        //        Booking booking = db.Bookings.Where(zz => zz.UserId == id).FirstOrDefault();
        //        booking.isReviewed = 1;
        //        db.Reviews.Add(review);
        //        PutBooking(id, booking);
               
        //        return review;

        //    }
        //    catch(Exception rr)
        //    {
        //        return rr.Data;
        //    }
        //}


        //private IHttpActionResult PutBooking(int id, Booking booking)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    if (id != booking.BookingID)
        //    {
        //        return BadRequest();
        //    }

        //    db.Entry(booking).State = EntityState.Modified;

        //    try
        //    {
        //        db.SaveChanges();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!BookingExists(id))
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

        //private bool BookingExists(int id)
        //{
        //    return db.Bookings.Count(e => e.BookingID == id) > 0;
        //}
    }

            
}
