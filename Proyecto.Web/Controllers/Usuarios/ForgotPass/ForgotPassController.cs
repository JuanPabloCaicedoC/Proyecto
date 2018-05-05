using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Web.Controllers.Usuarios.ForgotPass
{
    public class ForgotPassController
    {

        public SqlConnection _SqlConnection = null;
        public SqlCommand _SqlCommand = null;
        public SqlDataAdapter _SqlDataAdapter = null;
        public SqlParameter _SqlParameter = null;
        string stConexion = string.Empty;

        /// <summary>
        /// METODO CONSTRUCTOR
        /// </summary>
        public ForgotPassController()
        {
            BL.clsConexion obclsConexion = new BL.clsConexion();
            stConexion = obclsConexion.getConexion();
        }

        /// <summary>
        /// CONSULTA USUARIO
        /// </summary>
        /// <param name="obclsUsuario"></param>
        /// <returns></returns>
        public DataSet ConsultarUsuarioCorreo(Models.Usuarios.Usuarios.clsUsuario obclsUsuario)
        {
            try
            {
                DataSet dsConsulta = new DataSet();

                _SqlConnection = new SqlConnection(stConexion);
                _SqlConnection.Open();

                _SqlCommand = new SqlCommand("Usuarios.spConsultarCorreo", _SqlConnection);
                _SqlCommand.CommandType = CommandType.StoredProcedure;

                _SqlCommand.Parameters.Add(new SqlParameter("@correo", obclsUsuario.stEmail));
                _SqlCommand.Parameters.Add(new SqlParameter("@usuario", obclsUsuario.stUsuario));

                _SqlCommand.ExecuteNonQuery();

                _SqlDataAdapter = new SqlDataAdapter(_SqlCommand);
                _SqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex) { throw ex; }
            finally { _SqlConnection.Close(); }
        }

        /// <summary>
        /// ENVIAR CORREO DE RECUPERACION DE CONTRASEÑA
        /// </summary>
        /// <param name="stServidor"></param>
        /// <param name="stUsuario"></param>
        /// <param name="stPassword"></param>
        /// <param name="blConexionSegura"></param>
        /// <param name="blAutenticacion"></param>
        /// <param name="stFrom"></param>
        /// <param name="stTo"></param>
        /// <param name="stAsunto"></param>
        /// <param name="stMensaje"></param>
        /// <param name="inTipo"></param>
        /// <param name="inPrioridad"></param>
        /// <param name="stPuerto"></param>

        public void envioEmail(string stServidor,
                               string stUsuario,
                               string stPassword,
                               bool blConexionSegura,
                               bool blAutenticacion,
                               string stFrom,
                               string stTo,
                               string stAsunto,
                               string stMensaje,
                               int inTipo,
                               int inPrioridad,
                               string stPuerto)
        {
            try
            {
                System.Net.Mail.MailMessage Mail = new System.Net.Mail.MailMessage();

                Mail.From = new System.Net.Mail.MailAddress(stFrom);
                Mail.To.Add(stTo);
                Mail.Subject = stAsunto;
                Mail.Body = stMensaje;

                if (inTipo == 0) Mail.IsBodyHtml = false; //Texto
                else if (inTipo == 1) Mail.IsBodyHtml = true;

                if (inPrioridad == 2) Mail.Priority = System.Net.Mail.MailPriority.High;
                else if (inPrioridad == 1) Mail.Priority = System.Net.Mail.MailPriority.Low;
                else if (inPrioridad == 3) Mail.Priority = System.Net.Mail.MailPriority.Normal;

                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
                smtp.Host = stServidor;

                if (blAutenticacion) smtp.Credentials = new System.Net.NetworkCredential(stUsuario, stPassword);
                if (stPuerto.Length > 0) smtp.Port = Convert.ToInt32(stPuerto);

                smtp.EnableSsl = blConexionSegura;
                smtp.Send(Mail);

            }
            catch (Exception ex ) { throw ex; }
        }

    }
}