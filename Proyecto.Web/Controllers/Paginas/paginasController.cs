using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Web.Controllers.Paginas
{
    public class PaginasController
    {
        public SqlConnection _SqlConnection = null;
        public SqlCommand _SqlCommand = null;
        public SqlDataAdapter _SqlDataAdapter = null;
        public SqlParameter _SqlParameter = null;
        string stConexion = string.Empty;

        /// <summary>
        /// METODO CONSTRUCTOR
        /// </summary>
        public PaginasController()
        {
            BL.clsConexion obclsConexion = new BL.clsConexion();
            stConexion = obclsConexion.getConexion();
        }

        /// <summary>
        /// CONSULTA DE LAS PAGINAS
        /// </summary>
        /// <returns></returns>

        public DataSet ConsultaPaginas()
        {

            try
            {
                DataSet dsConsulta = new DataSet();

                _SqlConnection = new SqlConnection(stConexion);
                _SqlConnection.Open();

                _SqlCommand = new SqlCommand("Seguridad.spConsultarPaginas", _SqlConnection);
                _SqlCommand.CommandType = CommandType.StoredProcedure;

                _SqlCommand.ExecuteNonQuery();

                _SqlDataAdapter = new SqlDataAdapter(_SqlCommand);
                _SqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex) { throw ex; }
            finally { _SqlConnection.Close(); }

        }

    }
}