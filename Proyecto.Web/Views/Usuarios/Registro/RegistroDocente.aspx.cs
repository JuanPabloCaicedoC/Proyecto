using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

namespace Proyecto.Web.Views.Usuarios.Registro_Docente
{
    public partial class RegistroDocente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                string stMensaje = string.Empty;
                if (string.IsNullOrEmpty(txtNombre.Text)) stMensaje += "Ingrese Nombre, ";
                if (string.IsNullOrEmpty(txtApellido.Text)) stMensaje += "Ingrese Apellido,";
                if (string.IsNullOrEmpty(txtEmail.Text)) stMensaje += "Ingrese Email,";
                if (string.IsNullOrEmpty(txtUsuario.Text)) stMensaje += "Ingrese Usuario,";
                if (string.IsNullOrEmpty(txtPassword.Text)) stMensaje += "Ingrese Password,";

                if (!string.IsNullOrEmpty(stMensaje)) throw new Exception(stMensaje.TrimEnd(','));

                Controllers.Usuarios.Registro.RegistroController obRegistroController = new Controllers.Usuarios.Registro.RegistroController();

                //Definicion Objeto
                Models.Usuarios.Usuarios.clsUsuario obclsUsuario = new Models.Usuarios.Usuarios.clsUsuario
                {
                    stNombre = txtNombre.Text,
                    stApellido = txtApellido.Text,
                    stEmail = txtEmail.Text,
                    stUsuario = txtUsuario.Text,
                    stPassword = txtPassword.Text,
                    obclsPerfiles = new Models.Usuarios.Perfiles.clsPerfiles {
                        inCodigo = 3
                    }
                };

                string respuesta = obRegistroController.InserarUsuario(obclsUsuario);

                if (respuesta.Equals("Usted se a registrado correctamente"))
                {
                    txtNombre.Text = string.Empty;
                    txtApellido.Text = string.Empty;
                    txtEmail.Text = string.Empty;
                    txtUsuario.Text = string.Empty;
                    txtPassword.Text = string.Empty;

                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Buen Trabajo!', '" + respuesta + "!', 'success') </script>");

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Error!', '" + respuesta + "!', 'error') </script>");
                    txtUsuario.Text = string.Empty;
                }

            }
            catch (Exception ex) 
            { ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Error!', '"+ ex.Message +"!', 'error') </script>"); }
        }
    }
}