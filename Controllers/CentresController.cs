using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using API.Models;

namespace API.Controllers
{
    public class CentresController : Controller
    {
        private UCTEntities db = new UCTEntities();

        // GET: Centres
        public async Task<ActionResult> Index()
        {
            return View(await db.Centres.ToListAsync());
        }

        // GET: Centres/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Centre centre = await db.Centres.FindAsync(id);
            if (centre == null)
            {
                return HttpNotFound();
            }
            return View(centre);
        }

        // GET: Centres/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Centres/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "CentreId,CentreName,CentreLocation")] Centre centre)
        {
            if (ModelState.IsValid)
            {
                db.Centres.Add(centre);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(centre);
        }

        // GET: Centres/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Centre centre = await db.Centres.FindAsync(id);
            if (centre == null)
            {
                return HttpNotFound();
            }
            return View(centre);
        }

        // POST: Centres/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.

        [HttpPost]
        [Route("api/Centres/Edit/{id}")]
        public async Task<ActionResult> Edit([Bind(Include = "CentreId,CentreName,CentreLocation")] Centre centre)
        {
            if (ModelState.IsValid)
            {
                db.Entry(centre).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(centre);
        }

        // GET: Centres/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Centre centre = await db.Centres.FindAsync(id);
            if (centre == null)
            {
                return HttpNotFound();
            }
            return View(centre);
        }

        // POST: Centres/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Centre centre = await db.Centres.FindAsync(id);
            db.Centres.Remove(centre);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
