using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Proyecto.Web.Views.Usuarios.Usuarios
{
    public partial class usuarios : System.Web.UI.Page
    {
        int codUsuario;
        int codigo;
        /// <summary>
        /// OBTIENE LA CONSULTA A USUARIOS
        /// </summary>
        void getUsuarios()
        {
            try
            {
                Controllers.Usuarios.Usuarios.UsuariosController obUsuariosController = new Controllers.Usuarios.Usuarios.UsuariosController();
                DataSet dsConsulta = obUsuariosController.ConsultaUsuarios();

                if (dsConsulta.Tables[0].Rows.Count > 0)
                {
                    gvwDatos.DataSource = dsConsulta;
                }
                else
                {
                    gvwDatos.DataSource = null;
                }

                gvwDatos.DataBind();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Error!', '" + ex.Message + "!', 'error') </script>");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Controllers.Perfiles.PerfilesController obPerfilesController = new Controllers.Perfiles.PerfilesController();
                DataSet dsConsultaPerfiles = obPerfilesController.ConsultaPefiles();

                ddlPerfiles.DataSource = dsConsultaPerfiles;
                ddlPerfiles.DataTextField = "perfDescripcion";
                ddlPerfiles.DataValueField = "perfCodigo";
                ddlPerfiles.DataBind();

                getUsuarios();
            }
        }

        protected void gvwDatos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                int inIndice = Convert.ToInt32(e.CommandArgument);

                if (e.CommandName.Equals("Editar"))
                {
                    lblOpcion.Text = "2";
                    //Accede al control web dentro de una grid                   

                    lblCodUsuario.Text = ((Label)gvwDatos.Rows[inIndice].FindControl("lblCodigo")).Text;

                    txtNombre.Text = gvwDatos.Rows[inIndice].Cells[1].Text;
                    txtApellido.Text = gvwDatos.Rows[inIndice].Cells[2].Text;
                    txtCorreo.Text = gvwDatos.Rows[inIndice].Cells[3].Text;
                    txtUsuario.Text = gvwDatos.Rows[inIndice].Cells[4].Text;
                    txtPassword.Text = ((Label)gvwDatos.Rows[inIndice].FindControl("lblPassword")).Text;
                    txtPassword.Enabled = false;
                    ddlPerfiles.SelectedValue = ((Label)gvwDatos.Rows[inIndice].FindControl("lblPerfil")).Text;

                }
                else if (e.CommandName.Equals("Eliminar"))
                {
                    lblOpcion.Text = "3";

                    Models.Usuarios.Usuarios.clsUsuario obclsUsuario = new Models.Usuarios.Usuarios.clsUsuario
                    {
                        inCodigo = Convert.ToInt32(((Label)gvwDatos.Rows[inIndice].FindControl("lblCodigo")).Text),
                        stNombre = string.Empty,
                        stApellido = string.Empty,
                        stEmail = string.Empty,
                        stUsuario = string.Empty,
                        stPassword = string.Empty,
                        obclsPerfiles = new Models.Usuarios.Perfiles.clsPerfiles
                        {
                            inCodigo = 0
                        }
                    };

                    Controllers.Usuarios.Usuarios.UsuariosController obUsuariosController = new Controllers.Usuarios.Usuarios.UsuariosController();

                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('successful!', '" + obUsuariosController.AministrarUsuarios(obclsUsuario, Convert.ToInt32(lblOpcion.Text)) + "!', 'success') </script>");

                    lblOpcion.Text = string.Empty;

                    getUsuarios();
                }

            }
            catch (Exception ex) { ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Error!', '" + ex.Message + "!', 'error') </script>"); }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string stMensaje = string.Empty;
                if (string.IsNullOrEmpty(txtNombre.Text)) stMensaje += "Ingrese Nombre, ";
                if (string.IsNullOrEmpty(txtApellido.Text)) stMensaje += "Ingrese Apellido,";
                if (string.IsNullOrEmpty(txtCorreo.Text)) stMensaje += "Ingrese Correo, ";
                if (string.IsNullOrEmpty(txtUsuario.Text)) stMensaje += "Ingrese Usuario,";
                if (lblOpcion.Text != "2" && string.IsNullOrEmpty(txtPassword.Text)) stMensaje += "Ingrese Contraseña, ";

                if (!string.IsNullOrEmpty(stMensaje)) throw new Exception(stMensaje.TrimEnd(','));

                codigo = 0;
                if (lblOpcion.Text == "2")
                {
                    codigo = Convert.ToInt32(lblCodUsuario.Text);

                };

                Models.Usuarios.Usuarios.clsUsuario obclsUsuario = new Models.Usuarios.Usuarios.clsUsuario
                {
                    inCodigo = codigo,
                    stNombre = txtNombre.Text,
                    stApellido = txtApellido.Text,
                    stEmail = txtCorreo.Text,
                    stUsuario = txtUsuario.Text,
                    stPassword = txtPassword.Text,
                    obclsPerfiles = new Models.Usuarios.Perfiles.clsPerfiles
                    {
                        inCodigo = Convert.ToInt32(ddlPerfiles.SelectedValue)
                    }
                };

                Controllers.Usuarios.Usuarios.UsuariosController obUsuariosController = new Controllers.Usuarios.Usuarios.UsuariosController();

                if (string.IsNullOrEmpty(lblOpcion.Text)) lblOpcion.Text = "1";

                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('successful!', '" + obUsuariosController.AministrarUsuarios(obclsUsuario, Convert.ToInt32(lblOpcion.Text)) + "!', 'success') </script>");

                txtNombre.Text = string.Empty;
                txtApellido.Text = string.Empty;
                txtCorreo.Text = string.Empty;
                txtUsuario.Text = string.Empty;
                txtPassword.Enabled = true;
                txtPassword.Text = string.Empty;

                getUsuarios();

            }
            catch (Exception ex) { ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Error!', '" + ex.Message + "!', 'error') </script>"); }

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                string stMensaje = string.Empty;
                if (string.IsNullOrEmpty(txtCodigo.Text)) stMensaje += "Ingrese Codigo, ";

                if (!string.IsNullOrEmpty(stMensaje)) throw new Exception(stMensaje.TrimEnd(','));

                Models.Usuarios.Usuarios.clsUsuario obclsUsuarios = new Models.Usuarios.Usuarios.clsUsuario
                {
                    inCodigo = Convert.ToInt32(txtCodigo.Text)
                };

                Controllers.Usuarios.Usuarios.UsuariosController obUsuariosController = new Controllers.Usuarios.Usuarios.UsuariosController();

                DataSet dsConsulta = obUsuariosController.ConsultarCodUsuarios(obclsUsuarios);

                if (dsConsulta.Tables[0].Rows.Count > 0)
                {
                    gvwDatos.DataSource = dsConsulta;
                }
                else
                {
                    gvwDatos.DataSource = null;
                }

                txtCodigo.Text = string.Empty;

                gvwDatos.DataBind();
            }
            catch (Exception ex) { ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Error!', '" + ex.Message + "!', 'error') </script>"); }
        }

        protected void btnTodos_Click(object sender, EventArgs e)
        {
            txtCodigo.Text = string.Empty;
            getUsuarios();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
                txtNombre.Text = string.Empty;
                txtApellido.Text = string.Empty;
                txtCorreo.Text = string.Empty;
                txtUsuario.Text = string.Empty;
                txtPassword.Enabled = true;
                txtPassword.Text = string.Empty;
        }
    }
}