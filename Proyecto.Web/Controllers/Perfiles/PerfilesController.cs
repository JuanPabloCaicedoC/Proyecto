using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Web.Controllers.Perfiles
{
    public class PerfilesController
    {

        public SqlConnection _SqlConnection = null;
        public SqlCommand _SqlCommand = null;
        public SqlDataAdapter _SqlDataAdapter = null;
        public SqlParameter _SqlParameter = null;
        string stConexion = string.Empty;

        /// <summary>
        /// METODO CONSTRUCTOR
        /// </summary>
        public PerfilesController()
        {
            BL.clsConexion obclsConexion = new BL.clsConexion();
            stConexion = obclsConexion.getConexion();
        }

        /// <summary>
        /// CONSULTA DE LOS PERFILES
        /// </summary>
        /// <returns></returns>
        public DataSet ConsultaPefiles()
        {
            try
            {
                DataSet dsConsulta = new DataSet();

                _SqlConnection = new SqlConnection(stConexion);
                _SqlConnection.Open();

                _SqlCommand = new SqlCommand("Usuarios.spConsultarPerfiles", _SqlConnection);
                _SqlCommand.CommandType = CommandType.StoredProcedure;

                _SqlCommand.ExecuteNonQuery();

                _SqlDataAdapter = new SqlDataAdapter(_SqlCommand);
                _SqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex) { throw ex; }
            finally { _SqlConnection.Close(); }
        }

        /// <summary>
        /// CRUD DE LA TABLA PERFILES
        /// </summary>
        /// <param name="obclsPerfiles"></param>
        /// <param name="inOpcion"></param>
        /// <returns></returns>
        public string AministrarPefiles(Models.Usuarios.Perfiles.clsPerfiles obclsPerfiles, int inOpcion)
        {
            try
            {
                _SqlConnection = new SqlConnection(stConexion);
                _SqlConnection.Open();

                _SqlCommand = new SqlCommand("Usuarios.spAdministrarPerfiles", _SqlConnection);
                _SqlCommand.CommandType = CommandType.StoredProcedure;

                _SqlCommand.Parameters.Add(new SqlParameter("@codigo", obclsPerfiles.inCodigo));
                _SqlCommand.Parameters.Add(new SqlParameter("@descripcion", obclsPerfiles.stDescripcion));
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