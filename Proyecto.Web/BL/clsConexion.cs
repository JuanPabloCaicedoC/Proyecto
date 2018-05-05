using System.Configuration;


namespace Proyecto.Web.BL
{
    public class clsConexion
    {
        /// <summary>
        /// CONSULTA CONEXION BBDD
        /// </summary>
        /// <returns></returns>
        public string getConexion()
        {
            return ConfigurationManager.ConnectionStrings["Cnx"].ToString();
        }
    }
}