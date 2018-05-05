using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Web.Controllers.Usuarios.Registro
{
    public class RegistroController
    {

        public SqlConnection _SqlConnection = null;
        public SqlCommand _SqlCommand = null;
        public SqlDataAdapter _SqlDataAdapter = null;
        public SqlParameter _SqlParameter = null;
        string stConexion = string.Empty;

        /// <summary>
        /// METODO CONSTRUCTOR
        /// </summary>
        public RegistroController()
        {
            BL.clsConexion obclsConexion = new BL.clsConexion();
            stConexion = obclsConexion.getConexion();
        }

        /// <summary>
        /// INSERTAR USUARIO
        /// </summary>
        /// <param name="obclsUsuario"></param>
        /// <returns></returns>
        /// 

        public string InserarUsuario(Models.Usuarios.Usuarios.clsUsuario obclsUsuario)
        {
            try
            {

                _SqlConnection = new SqlConnection(stConexion);
                _SqlConnection.Open();

                _SqlCommand = new SqlCommand("Usuarios.spInsertarUsuarios", _SqlConnection);
                _SqlCommand.CommandType = CommandType.StoredProcedure;


                _SqlCommand.Parameters.Add(new SqlParameter("@Nombre", obclsUsuario.stNombre));
                _SqlCommand.Parameters.Add(new SqlParameter("@Apellido", obclsUsuario.stApellido));
                _SqlCommand.Parameters.Add(new SqlParameter("@Email", obclsUsuario.stEmail));
                _SqlCommand.Parameters.Add(new SqlParameter("@Usuario", obclsUsuario.stUsuario));
                _SqlCommand.Parameters.Add(new SqlParameter("@Password", obclsUsuario.stPassword));
                _SqlCommand.Parameters.Add(new SqlParameter("@perfCodigo", obclsUsuario.obclsPerfiles.inCodigo));

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