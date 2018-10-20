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
using Newtonsoft.Json;
using System.Transactions;

namespace ISSMProject.Controllers
{
    
    public class UsuarioController : ApiController
    {

        DBModel context = new DBModel();
        
        //my services
        [HttpGet]
        public string GetTareas(string correo)
        {
            ISSMTarea task;
            string json;
               
            var usuario = context.Usuario.Where(x => x.Correo == correo).FirstOrDefault();
            if (usuario != null)
            {
                var tareas = context.Tarea.Where(x => x.UsuarioID == usuario.UsuarioID).ToList();
                List<ISSMTarea> lsttareasxusuario = new List<ISSMTarea>();

                if (tareas != null)
                {
                    foreach (var tarea in tareas)
                    {
                        task = new ISSMTarea();
                        task.usuarioid = usuario.UsuarioID;
                        task.Detalle = tarea.Detalle;
                        task.Estado = Convert.ToInt32(tarea.Estado);
                        lsttareasxusuario.Add(task);
                    }

                    json = JsonConvert.SerializeObject(lsttareasxusuario);
                }
                else
                {
                    json = "No hay tareas registradas para el usuario ingresado.";
                }
            }
            else
            {
                json = "No existe el usuario indicado.";
            }
            
            return json;
        }

        [HttpGet]
        public string GetUsuario(string correo)
        {
            ISSMUser user = new ISSMUser();
            string json;


            var usuario = context.Usuario.Where(x => x.Correo == correo).FirstOrDefault();

            if (usuario != null)
            {
                user.Nombres = usuario.FirstName;
                user.Apellidos = usuario.LastName;
                user.Correo = usuario.Correo;
                user.genero = usuario.Genero;
                user.distrito = usuario.Distrito;

                json = JsonConvert.SerializeObject(user, Formatting.Indented);
            }
            else
            {
                json = "No hay usuario con ese correo.";
            }

            return json;
        }

        [HttpPost]
        public string RegistrarUsuario(string datos)
        {
            ISSMUser newUser = new ISSMUser();
            string json;

            newUser = JsonConvert.DeserializeObject<ISSMUser>(datos);

            var usuario = context.Usuario.Where(x => x.Correo == newUser.Correo).FirstOrDefault();

            if (usuario == null)
            {
                using (var transactionScope = new TransactionScope())
                {
                    Usuario nuevo = new Usuario();

                    nuevo.LastName = newUser.Apellidos;
                    nuevo.FirstName = newUser.Nombres;
                    nuevo.Correo = newUser.Correo;
                    nuevo.Genero = newUser.genero;
                    nuevo.Distrito = newUser.distrito;

                    context.Usuario.Add(nuevo);
                    context.SaveChanges();

                    transactionScope.Complete();
                }

                json = "Usuario registrado con éxito";
            }
            else
            {
                json = "Ya hay un usuario con ese correo.";
            }

            return json;
        }

        [HttpPost]
        public string RegistrarTarea(string datos)
        {
            ISSMTarea newTarea = new ISSMTarea();
            string json;

            newTarea = JsonConvert.DeserializeObject<ISSMTarea>(datos);

            using (var transactionScope = new TransactionScope())
            {
                Tarea nuevaTarea = new Tarea();

                nuevaTarea.UsuarioID = newTarea.usuarioid;
                nuevaTarea.Detalle = newTarea.Detalle;
                nuevaTarea.Estado = 0;

                context.Tarea.Add(nuevaTarea);
                context.SaveChanges();

                transactionScope.Complete();
            }

            json = "Tarea registrada con éxito";

            return json;
        }

        [HttpPost]
        public string ActualizarTarea(string datos)
        {
            ISSMTarea newTarea = new ISSMTarea();
            string json;

            newTarea = JsonConvert.DeserializeObject<ISSMTarea>(datos);

            using (var transactionScope = new TransactionScope())
            {
                var oldtarea = context.Tarea.Where(x => x.TareaID == newTarea.tareaid && x.UsuarioID == newTarea.usuarioid).FirstOrDefault();
                
                oldtarea.Detalle = newTarea.Detalle;
                oldtarea.Estado = newTarea.Estado;
                
                context.SaveChanges();

                transactionScope.Complete();
            }

            json = "Tarea actualizada con éxito";

            return json;
        }

        [HttpPost]
        public string EliminarTarea(string datos)
        {
            //ISSMTarea newTarea = new ISSMTarea();
            string json;

            Dictionary<string, string> datosTarea = JsonConvert.DeserializeObject<Dictionary<string, string>>(datos);
            int tareaid = Convert.ToInt32(datosTarea["tareaid"]);
            int usuarioid = Convert.ToInt32(datosTarea["usuarioid"]);

            var oldtarea = context.Tarea.Where(x => x.TareaID == tareaid && x.UsuarioID == usuarioid).FirstOrDefault();
            if (oldtarea != null)
            {
                using (var transactionScope = new TransactionScope())
                {
                    context.Tarea.Remove(oldtarea);
                    context.SaveChanges();

                    transactionScope.Complete();
                }

                json = "Tarea eliminada con éxito";
            }
            else
            {
                json = "la tarea no se encontró en la base de datos.";
            }
            return json;
        }
    }
}