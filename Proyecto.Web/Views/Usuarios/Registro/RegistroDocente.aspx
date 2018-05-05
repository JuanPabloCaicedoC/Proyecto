<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroDocente.aspx.cs" Inherits="Proyecto.Web.Views.Usuarios.Registro_Docente.RegistroDocente" %>

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
        <div class="card card-register mx-auto mt-5">
            <div class="card-header">Registro</div>
            <div class="card-body">
                <form id="form1" runat="server">
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                                <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblApellido" runat="server" Text="Apellido"></asp:Label>
                                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                                <asp:Label ID="lblUsuario" runat="server" Text="Usuario"></asp:Label>
                                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary btn-block" Text="Registrar" OnClick="btnRegistrar_Click" />
                </form>
                <div class="text-center">
                    <a class="d-block small mt-3" href="../Login/Login.aspx">Volver</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
