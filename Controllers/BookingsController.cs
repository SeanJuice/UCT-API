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
    public class BookingsController : ApiController
    {
        //    private RonnetDB5Entities db = new RonnetDB5Entities();

        //    // GET: api/Bookings
        //    public List<Booking> GetBookings()
        //    {
        //        db.Configuration.ProxyCreationEnabled = false;
        //        dynamic results = new ExpandoObject();
        //        try
        //        {
        //            List<Booking> bookings = db.Bookings.ToList();

        //            results = bookings;
        //            return results;
        //        }
        //        catch (Exception)
        //        {
        //            return null;
        //        }
        //    }

        //    // GET: api/Bookings/5
        //    [ResponseType(typeof(Booking))]
        //    public IHttpActionResult GetBooking(int id)
        //    {
        //        Booking booking = db.Bookings.Find(id);
        //        if (booking == null)
        //        {
        //            return NotFound();
        //        }

        //        return Ok(booking);
        //    }

        //    // PUT: api/Bookings/5
        //    [ResponseType(typeof(void))]
        //    public  IHttpActionResult PutBooking(int id, Booking booking)
        //    {
        //        if (!ModelState.IsValid)
        //        {
        //            return BadRequest(ModelState);
        //        }

        //        if (id != booking.BookingID)
        //        {
        //            return BadRequest();
        //        }

        //        db.Entry(booking).State = EntityState.Modified;

        //        try
        //        {
        //            db.SaveChanges();
        //        }
        //        catch (DbUpdateConcurrencyException)
        //        {
        //            if (!BookingExists(id))
        //            {
        //                return NotFound();
        //            }
        //            else
        //            {
        //                throw;
        //            }
        //        }

        //        return StatusCode(HttpStatusCode.NoContent);
        //    }

        //    // POST: api/Bookings
        //    [ResponseType(typeof(Booking))]
        //    public IHttpActionResult PostBooking(Booking booking)
        //    {
        //        if (!ModelState.IsValid)
        //        {
        //            return BadRequest(ModelState);
        //        }

        //        db.Bookings.Add(booking);
        //        db.SaveChanges();

        //        return CreatedAtRoute("DefaultApi", new { id = booking.BookingID }, booking);
        //    }

        //    // DELETE: api/Bookings/5
        //    [ResponseType(typeof(Booking))]
        //    public IHttpActionResult DeleteBooking(int id)
        //    {
        //        Booking booking = db.Bookings.Find(id);
        //        if (booking == null)
        //        {
        //            return NotFound();
        //        }

        //        db.Bookings.Remove(booking);
        //        db.SaveChanges();

        //        return Ok(booking);
        //    }
        //    [HttpGet]
        //    [Route("api/Bookings/getTimeslots/")]
        //    public object getTimeslots()
        //    {
        //        db.Configuration.ProxyCreationEnabled = false;
        //        dynamic results = new ExpandoObject();
        //        try
        //        {
        //            List<TimeSlot> slots = db.TimeSlots.ToList();

        //            results = slots;
        //            return results;
        //        }
        //        catch (Exception)
        //        {
        //            return null;
        //        }
        //    }
        //    [HttpGet]
        //    [Route("api/Bookings/getBookingTypes/")]
        //    public object getBookingTypes()
        //    {
        //        db.Configuration.ProxyCreationEnabled = false;
        //        dynamic results = new ExpandoObject();
        //        try
        //        {
        //            List<BookingType> types = db.BookingTypes.ToList();

        //            results = types;
        //            return results;
        //        }
        //        catch (Exception)
        //        {
        //            return null;
        //        }
        //    }

        //    [HttpGet]
        //    [Route("api/Bookings/getBranches/")]
        //    public object getBranches()
        //    {
        //        db.Configuration.ProxyCreationEnabled = false;
        //        dynamic results = new ExpandoObject();
        //        try
        //        {
        //            List<Info> branches = db.Infos.ToList();

        //            results = branches;
        //            return results;
        //        }
        //        catch (Exception)
        //        {
        //            return null;
        //        }
        //    }


        //    [HttpPost]
        //    [Route("api/Bookings/InsertHistory/{id}/{userId}/{des}")]
        //    public object InsertHistory(int id, int userId,string des)
        //    {
        //        try
        //        {
        //            BookingHistory booking = new BookingHistory();
        //            booking.BookingID = id;
        //            booking.Description = des;
        //            booking.Date = DateTime.Now;
        //            booking.UserId = userId;
        //            db.BookingHistories.Add(booking);
        //            db.SaveChanges();
        //            return booking;
        //        }
        //        catch 
        //        {
        //            return null;
        //        }
        //    }


        //    [HttpGet]
        //    [Route("api/Bookings/getBookingHistory/")]
        //    public object getBookingHistory()
        //    {
        //        db.Configuration.ProxyCreationEnabled = false;
        //        List<object> list = new List<object>();
        //        try
        //        {
        //            List<BookingHistory> histories = db.BookingHistories.ToList();

        //            histories.ForEach(element =>
        //            {

        //                User usr = db.Users.Where(rr => rr.User_ID == element.UserId).FirstOrDefault();
        //                dynamic obj = new ExpandoObject();
        //                obj.User = usr.FullName;
        //                obj.Date = element.Date;

        //                obj.Description = element.Description;
        //                list.Add(obj);
        //            });


        //            return list;
        //        }
        //        catch (Exception)
        //        {
        //            return null;
        //        }
        //    }

        //    protected override void Dispose(bool disposing)
        //    {
        //        if (disposing)
        //        {
        //            db.Dispose();
        //        }
        //        base.Dispose(disposing);
        //    }

        //    private bool BookingExists(int id)
        //    {
        //        return db.Bookings.Count(e => e.BookingID == id) > 0;
        //    }
        //    [HttpGet]
        //    [Route("api/Users/getReviews/{id}")]
        //    public object getReviews(int id)
        //    {
        //        db.Configuration.ProxyCreationEnabled = false;

        //        try
        //        {

        //            List<object> ToReturnList = new List<object>();
        //            List<Review> reviews = db.Reviews.ToList();
        //            foreach (var rev in reviews)
        //            {
        //                dynamic obj = new ExpandoObject();
        //                User user = db.Users.Where(r => r.User_ID == rev.user_id).FirstOrDefault();
        //                obj.friendlyness = rev.friendlyness;
        //                obj.knowledge = rev.knowledge;
        //                obj.quickiness = rev.quickiness;
        //                obj.customerService = rev.customerService;
        //                obj.improvementNotes = rev.improvementNotes;
        //                obj.User = user.FullName;
        //                obj.RoleID = user.UserRole_ID;
        //                ToReturnList.Add(obj);
        //            }

        //                return ToReturnList;


        //        }
        //        catch (Exception)
        //        {
        //            return null;
        //        }
        //    }
        //}
    }
}