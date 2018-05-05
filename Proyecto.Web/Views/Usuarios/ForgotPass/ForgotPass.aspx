<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPass.aspx.cs" Inherits="Proyecto.Web.Views.Usuarios.ForgotPass.ForgotPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Login</title>
    <!-- Bootstrap core CSS-->
    <link href="../../../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom fonts for this template-->
    <link href="../../../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Custom styles for this template-->
    <link href="../../../css/sb-admin.css" rel="stylesheet" />
    <!-- Bootstrap core JavaScript-->
    <script src="../../../vendor/jquery/jquery.min.js"></script>
    <script src="../../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="../../../vendor/jquery-easing/jquery.easing.min.js"></script>

    <link href="../../../css/sweetalert.css" rel="stylesheet" />
    <script src="../../../js/sweetalert.min.js" type="text/javascript"></script>

</head>
<body class="bg-dark">
    <div class="container">
        <div class="card card-login mx-auto mt-5">
            <div class="card-header">Recuperar Contraseña</div>
            <div class="card-body">
                <div class="text-center mt-4 mb-5">
                    <h4>Olvidaste tu contraseña?</h4>
                    <p>Escriba su Correo y usuario con el que se registro para enviarle la contraseña</p>
                </div>
                <form id="form1" runat="server">
                    <div class="form-group">
                        <asp:Label ID="lblUsuario" runat="server" Text="Usuario"></asp:Label>
                        <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:Label ID="lblEmail" runat="server" Text="Correo"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnEnvPass" runat="server" CssClass="btn btn-primary btn-block" Text="Enviar Contraseña" OnClick="btnEnvPass_Click" />
                </form>
                <div class="text-center">
                    <a class="d-block small mt-3" href="../Registro/RegistroDocente.aspx">Registrar una cuenta</a>
                    <a class="d-block small" href="../Login/Login.aspx">Volver</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
