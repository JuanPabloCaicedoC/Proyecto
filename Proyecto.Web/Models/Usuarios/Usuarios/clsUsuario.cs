namespace Proyecto.Web.Models.Usuarios.Usuarios
{
    public class clsUsuario
    {
        public int inCodigo { get; set; }
        public string stNombre { get; set; }
        public string stApellido { get; set; }
        public string stEmail { get; set; }
        public string stUsuario { get; set; }
        public string stPassword { get; set; }
        public Perfiles.clsPerfiles obclsPerfiles { get; set; }
    }
}