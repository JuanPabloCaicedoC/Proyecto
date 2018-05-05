using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Proyecto.Web.Views.Usuarios.Perfiles
{
    public partial class Perfiles : System.Web.UI.Page
    {
        /// <summary>
        /// OBTIENE LA CONSULTA A PERFILES
        /// </summary>
        void getPerfiles()
        {
            try
            {
                Controllers.Perfiles.PerfilesController obPerfilesController = new Controllers.Perfiles.PerfilesController();
                DataSet dsConsulta = obPerfilesController.ConsultaPefiles();

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
            if (!IsPostBack) getPerfiles();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {

                string stMensaje = string.Empty;
                if (string.IsNullOrEmpty(txtCodigo.Text)) stMensaje += "Ingrese Codigo, ";
                if (string.IsNullOrEmpty(txtPerfil.Text)) stMensaje += "Ingrese Perfil,";

                if (!string.IsNullOrEmpty(stMensaje)) throw new Exception(stMensaje.TrimEnd(','));

                Models.Usuarios.Perfiles.clsPerfiles obclsPerfiles = new Models.Usuarios.Perfiles.clsPerfiles
                {
                    inCodigo = Convert.ToInt32(txtCodigo.Text),
                    stDescripcion = txtPerfil.Text

                };

                Controllers.Perfiles.PerfilesController obPerfilesController = new Controllers.Perfiles.PerfilesController();

                if (string.IsNullOrEmpty(lblOpcion.Text)) lblOpcion.Text = "1";

                if (obPerfilesController.AministrarPefiles(obclsPerfiles, Convert.ToInt32(lblOpcion.Text)).Equals("El codigo digitado ya existe"))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Error!', '" + obPerfilesController.AministrarPefiles(obclsPerfiles, Convert.ToInt32(lblOpcion.Text)) + "!', 'error') </script>");
                }
                else { ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Successful!', '" + obPerfilesController.AministrarPefiles(obclsPerfiles, Convert.ToInt32(lblOpcion.Text)) + "!', 'success') </script>"); }



                lblOpcion.Text = string.Empty;
                txtCodigo.Text = string.Empty;
                txtPerfil.Text = string.Empty;

                getPerfiles();

            }
            catch (Exception ex) { ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Error!', '" + ex.Message + "!', 'error') </script>"); }
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

                    txtCodigo.Text = ((Label)gvwDatos.Rows[inIndice].FindControl("lblCodigo")).Text;
                    txtPerfil.Text = gvwDatos.Rows[inIndice].Cells[1].Text;

                }
                else if (e.CommandName.Equals("Eliminar"))
                {
                    lblOpcion.Text = "3";

                    Models.Usuarios.Perfiles.clsPerfiles obclsPerfiles = new Models.Usuarios.Perfiles.clsPerfiles
                    {
                        inCodigo = Convert.ToInt32(((Label)gvwDatos.Rows[inIndice].FindControl("lblCodigo")).Text),
                        stDescripcion = string.Empty

                    };

                    Controllers.Perfiles.PerfilesController obPerfilesController = new Controllers.Perfiles.PerfilesController();

                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('successful!', '" + obPerfilesController.AministrarPefiles(obclsPerfiles, Convert.ToInt32(lblOpcion.Text)) + "!', 'success') </script>");

                    lblOpcion.Text = string.Empty;

                    getPerfiles();
                }
                else if (e.CommandName.Equals("Paginas"))
                {

                    Controllers.Paginas.PaginasController obclsPaginas = new Controllers.Paginas.PaginasController();

                    DataSet dsConsulta = new DataSet();//consulta paginas

                    dsConsulta = obclsPaginas.ConsultaPaginas();

                    gvwPaginas.DataSource = dsConsulta;
                    gvwPaginas.DataBind();

                    Controllers.PaginasPerfiles.PaginasPerfilesController obPaginasPerfiles = new Controllers.PaginasPerfiles.PaginasPerfilesController();

                    Models.Usuarios.PaginasPerfiles.clsPaginasPerfiles obclsPaginasPerfiles = new Models.Usuarios.PaginasPerfiles.clsPaginasPerfiles
                    {
                        obclsPerfiles = new Models.Usuarios.Perfiles.clsPerfiles
                        {
                            inCodigo = Convert.ToInt32(((Label)gvwDatos.Rows[inIndice].FindControl("lblCodigo")).Text),
                            stDescripcion = string.Empty
                        }                        

                    };                   

                    DataSet dsConsultaPaginasPerfil = new DataSet();//envias parametro cod_perfil

                    dsConsultaPaginasPerfil = obPaginasPerfiles.ConsultarPaginasPorPerfil(obclsPaginasPerfiles);

                    foreach (GridViewRow drRow in gvwPaginas.Rows)
                        ((CheckBox)drRow.FindControl("chkSeleccionar")).Checked =
                            dsConsultaPaginasPerfil.Tables[0].Select("pagiCodigo=" + drRow.Cells[0].Text).Length > 0
                            ? true : false;

                    lblCodPerfil.Text = ((Label)gvwDatos.Rows[inIndice].FindControl("lblCodigo")).Text;

                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> fnMostrar(); </script>");
                }
            }
            catch (Exception ex) { ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Error!', '" + ex.Message + "!', 'error') </script>"); }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            txtCodigo.Text = string.Empty;
            txtPerfil.Text = string.Empty;
        }

        protected void btnGuardarPaginas_Click(object sender, EventArgs e)
        {
            Controllers.PaginasPerfiles.PaginasPerfilesController obPaginasController = new Controllers.PaginasPerfiles.PaginasPerfilesController();
            string resultado  = "";
            foreach (GridViewRow drRow in gvwPaginas.Rows)
            {
                if (((CheckBox)drRow.FindControl("chkSeleccionar")).Checked)
                {
                    int inCodigoPerfil = Convert.ToInt32(lblCodPerfil.Text);
                    int inCodigo = Convert.ToInt32(drRow.Cells[0].Text);

                    Models.Usuarios.PaginasPerfiles.clsPaginasPerfiles obclsPaginasPerfiles = new Models.Usuarios.PaginasPerfiles.clsPaginasPerfiles
                    {
                        obclsPaginas = new Models.Usuarios.Paginas.clsPaginas
                        {
                            inCodigo = inCodigo,
                            stDescripcion = string.Empty
                        },
                        obclsPerfiles = new Models.Usuarios.Perfiles.clsPerfiles
                        {
                            inCodigo = inCodigoPerfil,
                            stDescripcion = string.Empty
                        }

                    };

                    resultado = obPaginasController.AdministrarPaginasPerfiles(obclsPaginasPerfiles, 1);

                    //if exists (perfil and pagina)

                    //cod_pagina
                    //cod_perfil
                    //drRow.Cells[0]
                    //indicador = 'S'
                }
                else
                {
                    int inCodigoPerfil = Convert.ToInt32(lblCodPerfil.Text);
                    int inCodigoPagina = Convert.ToInt32(drRow.Cells[0].Text);

                    Models.Usuarios.PaginasPerfiles.clsPaginasPerfiles obclsPaginasPerfiles = new Models.Usuarios.PaginasPerfiles.clsPaginasPerfiles
                    {
                        obclsPaginas = new Models.Usuarios.Paginas.clsPaginas
                        {
                            inCodigo = inCodigoPagina,
                            stDescripcion = string.Empty
                        },
                        obclsPerfiles = new Models.Usuarios.Perfiles.clsPerfiles
                        {
                            inCodigo = inCodigoPerfil,
                            stDescripcion = string.Empty
                        }

                    };

                    resultado = obPaginasController.AdministrarPaginasPerfiles(obclsPaginasPerfiles, 2);

                    //indicador = 'N'
                }
            }

            ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('successful!', '" + resultado + "!', 'success') </script>");

        }
    }
}
