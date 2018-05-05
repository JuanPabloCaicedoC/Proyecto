using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Web.Controllers.Usuarios.Usuarios
{
    public class UsuariosController
    {

        public SqlConnection _SqlConnection = null;
        public SqlCommand _SqlCommand = null;
        public SqlDataAdapter _SqlDataAdapter = null;
        public SqlParameter _SqlParameter = null;
        string stConexion = string.Empty;

        /// <summary>
        /// METODO CONSTRUCTOR
        /// </summary>
        public UsuariosController()
        {
            BL.clsConexion obclsConexion = new BL.clsConexion();
            stConexion = obclsConexion.getConexion();
        }

        /// <summary>
        /// CONSULTA DE LOS USUARIOS
        /// </summary>
        /// <returns></returns>
        public DataSet ConsultaUsuarios()
        {
            try
            {
                DataSet dsConsulta = new DataSet();

                _SqlConnection = new SqlConnection(stConexion);
                _SqlConnection.Open();

                _SqlCommand = new SqlCommand("Usuarios.spConsultarUsu", _SqlConnection);
                _SqlCommand.CommandType = CommandType.StoredProcedure;

                _SqlCommand.ExecuteNonQuery();

                _SqlDataAdapter = new SqlDataAdapter(_SqlCommand);
                _SqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex) { throw ex; }
            finally { _SqlConnection.Close(); }
        }

        public string AministrarUsuarios(Models.Usuarios.Usuarios.clsUsuario obclsUsuarios, int inOpcion)
        {
            try
            {
                _SqlConnection = new SqlConnection(stConexion);
                _SqlConnection.Open();

                _SqlCommand = new SqlCommand("Usuarios.spAdministrarUsuarios", _SqlConnection);
                _SqlCommand.CommandType = CommandType.StoredProcedure;

                _SqlCommand.Parameters.Add(new SqlParameter("@Codigo", obclsUsuarios.inCodigo));
                _SqlCommand.Parameters.Add(new SqlParameter("@Nombre", obclsUsuarios.stNombre));
                _SqlCommand.Parameters.Add(new SqlParameter("@Apellido", obclsUsuarios.stApellido));
                _SqlCommand.Parameters.Add(new SqlParameter("@Email", obclsUsuarios.stEmail));
                _SqlCommand.Parameters.Add(new SqlParameter("@Usuario", obclsUsuarios.stUsuario));
                _SqlCommand.Parameters.Add(new SqlParameter("@Password", obclsUsuarios.stPassword));
                _SqlCommand.Parameters.Add(new SqlParameter("@perfCodigo", obclsUsuarios.obclsPerfiles.inCodigo));
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

        public DataSet ConsultarCodUsuarios(Models.Usuarios.Usuarios.clsUsuario obclsUsuarios)
        {
            try
            {
                DataSet dsConsulta = new DataSet();

                _SqlConnection = new SqlConnection(stConexion);
                _SqlConnection.Open();

                _SqlCommand = new SqlCommand("Usuarios.spConsultarCodUsu", _SqlConnection);
                _SqlCommand.CommandType = CommandType.StoredProcedure;

                _SqlCommand.Parameters.Add(new SqlParameter("@Codigo", obclsUsuarios.inCodigo));

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