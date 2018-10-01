using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using ISSMProject.Models;

namespace ISSMProject.Controllers
{
    public class TareaController : ApiController
    {
        private DBModel db = new DBModel();

        // GET: api/Tarea
        public IQueryable<Tarea> GetTarea()
        {
            return db.Tarea;
        }

        // GET: api/Tarea/5
        [ResponseType(typeof(Tarea))]
        public IHttpActionResult GetTarea(int id)
        {
            Tarea tarea = db.Tarea.Find(id);
            if (tarea == null)
            {
                return NotFound();
            }

            return Ok(tarea);
        }

        // PUT: api/Tarea/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutTarea(int id, Tarea tarea)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tarea.TareaID)
            {
                return BadRequest();
            }

            db.Entry(tarea).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TareaExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Tarea
        [ResponseType(typeof(Tarea))]
        public IHttpActionResult PostTarea(Tarea tarea)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Tarea.Add(tarea);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = tarea.TareaID }, tarea);
        }

        // DELETE: api/Tarea/5
        [ResponseType(typeof(Tarea))]
        public IHttpActionResult DeleteTarea(int id)
        {
            Tarea tarea = db.Tarea.Find(id);
            if (tarea == null)
            {
                return NotFound();
            }

            db.Tarea.Remove(tarea);
            db.SaveChanges();

            return Ok(tarea);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TareaExists(int id)
        {
            return db.Tarea.Count(e => e.TareaID == id) > 0;
        }
    }
}