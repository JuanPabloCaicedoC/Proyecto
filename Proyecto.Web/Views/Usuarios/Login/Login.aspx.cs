using System;
using System.Data;

namespace Proyecto.Web.Views.Usuarios.Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Session.RemoveAll();
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                string stMensaje = string.Empty;
                if (string.IsNullOrEmpty(txtEmail.Text)) stMensaje += "Ingrese Email, ";
                if (string.IsNullOrEmpty(txtPassword.Text)) stMensaje += "Ingrese Password,";

                if (!string.IsNullOrEmpty(stMensaje)) throw new Exception(stMensaje.TrimEnd(','));

                Controllers.Usuarios.Login.LoginController obLoginController = new Controllers.Usuarios.Login.LoginController();

                //definicion objeto
                Models.Usuarios.Usuarios.clsUsuario obclsUsuario = new Models.Usuarios.Usuarios.clsUsuario
                {
                    stEmail = txtEmail.Text,
                    stPassword = txtPassword.Text
                };
                
                DataSet dsConsulta = obLoginController.ConsultarAutenticacionUsuario(obclsUsuario);

                if (dsConsulta.Tables[0].Rows.Count > 0)
                {
                    Session["Perfil"] = dsConsulta.Tables[0].Rows[0]["perfCodigo"];
                    Response.Redirect("../../Home.aspx");
                }
                else
                    throw new Exception("Usuario o password incorrecto");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Error!', '"+ ex.Message +"!', 'error') </script>");
            }
        }
    }
}