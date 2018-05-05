using System;

using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Web.Controllers.Usuarios.Login
{
    public class LoginController
    {
        public SqlConnection _SqlConnection = null;
        public SqlCommand _SqlCommand = null;
        public SqlDataAdapter _SqlDataAdapter = null;
        public SqlParameter _SqlParameter = null;
        string stConexion = string.Empty;

        /// <summary>
        /// METODO CONSTRUCTOR
        /// </summary>
        public LoginController()
        {
            BL.clsConexion obclsConexion = new BL.clsConexion();
            stConexion = obclsConexion.getConexion();
        }

        /// <summary>
        /// CONSULTA USUARIO
        /// </summary>
        /// <param name="obclsUsuario"></param>
        /// <returns></returns>
        public DataSet ConsultarAutenticacionUsuario(Models.Usuarios.Usuarios.clsUsuario obclsUsuario)
        {
            try
            {
                DataSet dsConsulta = new DataSet();

                _SqlConnection = new SqlConnection(stConexion);
                _SqlConnection.Open();

                _SqlCommand = new SqlCommand("Usuarios.spConsultarUsuarios", _SqlConnection);
                _SqlCommand.CommandType = CommandType.StoredProcedure;

                _SqlCommand.Parameters.Add(new SqlParameter("@Email", obclsUsuario.stEmail));
                _SqlCommand.Parameters.Add(new SqlParameter("@Password", obclsUsuario.stPassword));

                _SqlCommand.ExecuteNonQuery();

                _SqlDataAdapter = new SqlDataAdapter(_SqlCommand);
                _SqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex) { throw ex; }
            finally { _SqlConnection.Close(); }
        }

        public bool ValidarPaginas(Models.Usuarios.Usuarios.clsUsuario obclsUsuario, int inPagina)
        {
            try
            {
                DataSet dsConsulta = new DataSet();

                _SqlConnection = new SqlConnection(stConexion);
                _SqlConnection.Open();

                _SqlCommand = new SqlCommand("Seguridad.spValidarPaginas", _SqlConnection);
                _SqlCommand.CommandType = CommandType.StoredProcedure;

                _SqlCommand.Parameters.Add(new SqlParameter("@Perfil", obclsUsuario.obclsPerfiles.inCodigo));
                _SqlCommand.Parameters.Add(new SqlParameter("@Pagina", inPagina));

                _SqlCommand.ExecuteNonQuery();

                _SqlDataAdapter = new SqlDataAdapter(_SqlCommand);
                _SqlDataAdapter.Fill(dsConsulta);

                if (dsConsulta.Tables[0].Rows.Count > 0) return true;
                else return false;
            }
            catch (Exception ex) { throw ex; }
            finally { _SqlConnection.Close(); }
        }
    }
}