using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Web.Controllers.PaginasPerfiles
{
    public class PaginasPerfilesController
    {

        public SqlConnection _SqlConnection = null;
        public SqlCommand _SqlCommand = null;
        public SqlDataAdapter _SqlDataAdapter = null;
        public SqlParameter _SqlParameter = null;
        string stConexion = string.Empty;

        /// <summary>
        /// METODO CONSTRUCTOR
        /// </summary>
        public PaginasPerfilesController()
        {
            BL.clsConexion obclsConexion = new BL.clsConexion();
            stConexion = obclsConexion.getConexion();
        }

        public DataSet ConsultarPaginasPorPerfil(Models.Usuarios.PaginasPerfiles.clsPaginasPerfiles obclsPaginasPerfiles)
        {
            try
            {
                DataSet dsConsulta = new DataSet();

                _SqlConnection = new SqlConnection(stConexion);
                _SqlConnection.Open();

                _SqlCommand = new SqlCommand("Seguridad.spConsultarPaginasPorPerfil", _SqlConnection);
                _SqlCommand.CommandType = CommandType.StoredProcedure;

                _SqlCommand.Parameters.Add(new SqlParameter("@codigo", obclsPaginasPerfiles.obclsPerfiles.inCodigo));

                _SqlCommand.ExecuteNonQuery();

                _SqlDataAdapter = new SqlDataAdapter(_SqlCommand);
                _SqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex) { throw ex; }
            finally { _SqlConnection.Close(); }
        }

        public string AdministrarPaginasPerfiles(Models.Usuarios.PaginasPerfiles.clsPaginasPerfiles obclsPaginasPerfiles, int inOpcion)
        {
            try
            {
                _SqlConnection = new SqlConnection(stConexion);
                _SqlConnection.Open();

                _SqlCommand = new SqlCommand("Seguridad.spAdministrarPaginasPerfiles", _SqlConnection);
                _SqlCommand.CommandType = CommandType.StoredProcedure;

                _SqlCommand.Parameters.Add(new SqlParameter("@pagiCodigo", obclsPaginasPerfiles.obclsPaginas.inCodigo));
                _SqlCommand.Parameters.Add(new SqlParameter("@perfCodigo", obclsPaginasPerfiles.obclsPerfiles.inCodigo));
                _SqlCommand.Parameters.Add(new SqlParameter("@nOpcion", inOpcion));

                _SqlParameter = new SqlParameter();
                _SqlParameter.ParameterName = "@cMensaje";
                _SqlParameter.SqlDbType = SqlDbType.VarChar;
                _SqlParameter.Size = 50;
                _SqlParameter.Direction = ParameterDirection.Output;

                _SqlCommand.Parameters.Add(_SqlParameter);
                _SqlCommand.ExecuteNonQuery();

                return _SqlParameter.Value.ToString();
            }
            catch (Exception ex) { throw ex; }
            finally { _SqlConnection.Close(); }
        }

    }
}