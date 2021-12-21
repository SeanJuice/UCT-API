using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using System.Web.Mvc;
using API.Models;
using HttpDeleteAttribute = System.Web.Http.HttpDeleteAttribute;
using HttpGetAttribute = System.Web.Http.HttpGetAttribute;
using HttpPostAttribute = System.Web.Http.HttpPostAttribute;
using RouteAttribute = System.Web.Http.RouteAttribute;

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
        [Route("api/Users/getAllCourses")]
        public List<Cours> getAllCourses()
        {

            db.Configuration.ProxyCreationEnabled = false;
            List<object> list = new List<object>();
            try
            {
                List<Cours> types = db.Courses.ToList();
                return types;
            }
            catch (Exception)
            {
                return null;
            }

        }
        [HttpGet]
        [Route("api/Users/getCourses/{id}")]
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

        [HttpGet]
        [Route("api/Users/getProfile/{id}")]
        public object getProfile(int id)
        {

            db.Configuration.ProxyCreationEnabled = false;
            List<object> list = new List<object>();
            dynamic ToReturn = new ExpandoObject();
            try
            {
                User user = db.Users.Where(elem => elem.id == id).FirstOrDefault();

                ToReturn.FirstName = user.FirstName;
                ToReturn.Surname = user.Surname;
                ToReturn.type = user.UserTypeId;
                ToReturn.type = user.UserTypeId;
                ToReturn.isAtSchool = user.isAtSchool;
                ToReturn.Username = user.Username;

                if (ToReturn.isAtSchool != null)
                {
                    ToReturn.SchoolName = user.SchoolName;
                }

                return ToReturn;
            }
            catch (Exception)
            {
                return null;
            }

        }

        [HttpGet]
        [Route("api/Users/myCourses/{id}")]
        public List<object> myCourses(int id)
        {

            db.Configuration.ProxyCreationEnabled = false;
            List<object> list = new List<object>();
            dynamic ToReturn = new ExpandoObject();
            try
            {
                //List<CourseCentre> coursescentre = db.CourseCentres.Where(r => r.userId == id).ToList();
                List<Cours> courses = db.Courses.ToList();


                var coursescentre = db.CourseCentres.Include(c => c.Cours).Include(c =>c.Centre).Where(r => r.userId==id).ToList();

                foreach (CourseCentre x in coursescentre)
                {
                    ToReturn.Centre =x.Centre.CentreName;
                    ToReturn.Course = x.Cours.CourseDesc;
                    ToReturn.Marks = x.Marks;
                    ToReturn.Comments = x.Comments;
                    list.Add(ToReturn);

                };

                return list;
            }
            catch (Exception)
            {
                return null;
            }

        }

        [HttpGet]
        [Route("api/Users/getCentres")]
        public List<Centre> getCentres()
        {

            db.Configuration.ProxyCreationEnabled = false;
            List<object> list = new List<object>();
            try
            {
                List<Centre> Centres = db.Centres.ToList();
                return Centres;
            }
            catch (Exception)
            {
                return null;
            }

        }

        [Route("api/Users/RegisterCourse")]
        [HttpPost] //Eventually we need to check if the user is active or registered before logging in
        public object SubmitReview([FromBody] CourseCentre course)
        {
            db.Configuration.ProxyCreationEnabled = false;
            CourseCentre courseCentre = new CourseCentre();
            List<object> list = new List<object>();
            try
            {
                List<CourseCentre> Coursecentre = db.CourseCentres.Where(zz => zz.CourseId == course.CourseId).ToList();
                CourseCentre centre = db.CourseCentres.Where(r => r.userId == course.userId && r.CentreId != course.CentreId).FirstOrDefault();


                if(centre == null)
                {
                    if (Coursecentre.Count() < 35)
                    {
                        db.CourseCentres.Add(course);
                        db.SaveChanges();

                        return course;
                    }
                    else
                    {
                        dynamic ToReturn = new ExpandoObject();
                        ToReturn.Message="number";
                        return ToReturn;
                    }
                }
                else
                {
                    dynamic ToReturn = new ExpandoObject();
                    ToReturn.Message = "centre";
                    return ToReturn;
                    }


            }
            catch (Exception rr)
            {

                return rr.Data;
            }
        }


        //    Centre CRUD

        [HttpPost]
        [Route("api/Users/Create")]
        public  IHttpActionResult Create([Bind(Include = "CentreId,CentreName,CentreLocation")] Centre centre)
        {
          
            try
            {
                if (ModelState.IsValid)
                {
                    db.Centres.Add(centre);
                    db.SaveChanges();
                    return Ok(centre);
                }

            }
            catch (Exception)
            {
                throw;
            }
            return Ok(centre);

           
        }

        [HttpPost]
        [Route("api/Users/EditCentre/{id}")]
        public IHttpActionResult Edit([Bind(Include = "CentreId,CentreName,CentreLocation")] Centre centre, int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                Centre _centre = new Centre();
                _centre = db.Centres.Where(c => c.CentreId == id).FirstOrDefault();
                if (_centre != null)
                {
                    _centre.CentreName = centre.CentreName;
                    _centre.CentreLocation = centre.CentreLocation;

                }
                int i = db.SaveChanges();

            }
            catch (Exception)
            {
                throw;
            }
            return Ok(centre);

        }

        [HttpDelete]
        [Route("api/Users/DeleteCentre/{id}")]

        public IHttpActionResult  DeleteConfirmed(int id)
        {
            Centre centre =  db.Centres.Where(c=>c.CentreId == id).FirstOrDefault();
            db.Centres.Remove(centre);
             db.SaveChanges();
            return Ok();
        }

       // learners from specific centre
        [HttpGet]
        [Route("api/Users/getSpecificCentreStudents/{id}")]
        public List<object> getSpecificCentreStudents(int id)
        {

            db.Configuration.ProxyCreationEnabled = false;
            List<object> list = new List<object>();
            try
            {
                var users = db.CourseCentres.Include(b => b.User).Where(rs => rs.CourseId == id).Select(r => new { 
                Name =  r.User.FirstName,
                Surname = r.User.Surname
                }).ToList();
                return (List<object>)users;
            }
            catch (Exception c)
            {
                return null;
            }

        }

        [HttpGet]
        [Route("api/Users/getSpecificCourseStudents/{id}")]
        public List<User> getSpecificCourseStudents(int id)
        {

            db.Configuration.ProxyCreationEnabled = false;
            List<object> list = new List<object>();
            try
            {
                List<User> users = db.Users.Include(c => c.CourseCentres.Where(ex => ex.CourseId == id)).ToList();
                return users;
            }
            catch (Exception)
            {
                return null;
            }

        }

    }
}