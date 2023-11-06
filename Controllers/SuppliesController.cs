using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using OrderService.Models;

namespace OrderService.Controllers
{
    public class SuppliesController : Controller
    {
        private OrderServiceData db = new OrderServiceData();

        // GET: Supplies
        public ActionResult Index()
        {
            var supplies = db.Supplies.Include(s => s.Suppliers);
            return View(supplies.ToList());
        }

        // GET: Supplies/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Supplies supplies = db.Supplies.Find(id);
            if (supplies == null)
            {
                return HttpNotFound();
            }
            return View(supplies);
        }

        // GET: Supplies/Create
        public ActionResult Create()
        {
            ViewBag.SupplierID = new SelectList(db.Suppliers, "Id", "Title");
            return View();
        }

        // POST: Supplies/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. 
        // Дополнительные сведения см. в статье https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Date,SupplierID")] Supplies supplies)
        {
            if (ModelState.IsValid)
            {
                db.Supplies.Add(supplies);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SupplierID = new SelectList(db.Suppliers, "Id", "Title", supplies.SupplierID);
            return View(supplies);
        }

        // GET: Supplies/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Supplies supplies = db.Supplies.Find(id);
            if (supplies == null)
            {
                return HttpNotFound();
            }
            ViewBag.SupplierID = new SelectList(db.Suppliers, "Id", "Title", supplies.SupplierID);
            return View(supplies);
        }

        // POST: Supplies/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. 
        // Дополнительные сведения см. в статье https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Date,SupplierID")] Supplies supplies)
        {
            if (ModelState.IsValid)
            {
                db.Entry(supplies).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SupplierID = new SelectList(db.Suppliers, "Id", "Title", supplies.SupplierID);
            return View(supplies);
        }

        // GET: Supplies/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Supplies supplies = db.Supplies.Find(id);
            if (supplies == null)
            {
                return HttpNotFound();
            }
            return View(supplies);
        }

        // POST: Supplies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Supplies supplies = db.Supplies.Find(id);
            db.Supplies.Remove(supplies);
            db.SaveChanges();
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
