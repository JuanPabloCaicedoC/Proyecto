using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;

namespace Proyecto.Web.Views.Usuarios.ForgotPass
{
    public partial class ForgotPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnvPass_Click(object sender, EventArgs e)
        {
            try
            {

                string contraseña = " ";

                string stServidor = ConfigurationManager.AppSettings["stServidor"].ToString();
                string stUsuario = ConfigurationManager.AppSettings["stUsuario"].ToString();
                string stPassword = ConfigurationManager.AppSettings["stPassword"].ToString();
                string stPuerto = ConfigurationManager.AppSettings["stPuerto"].ToString();

                Controllers.Usuarios.ForgotPass.ForgotPassController obForgotPass = new Controllers.Usuarios.ForgotPass.ForgotPassController();

                Models.Usuarios.Usuarios.clsUsuario obclsCorreo = new Models.Usuarios.Usuarios.clsUsuario
                {
                    stUsuario = txtUsuario.Text,
                    stEmail = txtEmail.Text
                };

                DataSet dsConsulta = obForgotPass.ConsultarUsuarioCorreo(obclsCorreo);

                if (dsConsulta.Tables[0].Rows.Count > 0)
                {

                    contraseña = dsConsulta.Tables[0].Rows[0]["usuPassword"].ToString();

                    obForgotPass.envioEmail(stServidor,
                                        stUsuario,
                                        stPassword,
                                        true, true,
                                        stUsuario,
                                        txtEmail.Text,
                                        "Recuperacion Contraseña UTAP",
                                        "Su contraseña es: " + contraseña,
                                        0, 3,
                                        stPuerto);

                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Correcto!', 'Se envio Correo con exito!', 'success') </script>");

                    txtUsuario.Text = string.Empty;
                    txtEmail.Text = string.Empty;
                }
                else
                    throw new Exception("el usuario o correo ingresados no se encuentran registrados");   

                

            }
            catch (Exception ex)
            {

                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Error!', '" + ex.Message + "!', 'error') </script>");
                txtUsuario.Text = string.Empty;
                txtEmail.Text = string.Empty;

            }
        }
    }
}