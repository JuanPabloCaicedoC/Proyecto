using System;

namespace Proyecto.Web.Views
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                if (Session["Perfil"] == null)
                    Response.Redirect("Usuarios/Login/Login.aspx");
        }
    }
}