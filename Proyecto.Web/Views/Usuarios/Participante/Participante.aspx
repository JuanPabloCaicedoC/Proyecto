<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/Home.Master" AutoEventWireup="true" CodeBehind="Participante.aspx.cs" Inherits="Proyecto.Web.Views.Usuarios.Participante.Participante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
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
    <!-- Custom scripts for all pages-->
    <script src="../../../js/sb-admin.min.js"></script>

    <link href="../../../css/sweetalert.css" rel="stylesheet" />
    <script src="../../../js/sweetalert.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        function fnMostrar() {
            $("#btnModalPaginas").click();
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">


    <div class="mx-auto mt-5">
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-12">
                    <h3 class="text-center">HOJA DE VIDA INSTITUCIONAL</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="mx-auto mt-5">
        <div class="form-group">
            <div class="form-row">

                <div class="col-md-6">
                    <asp:Label runat="server" ID="lblOpcionAdministrativo" Visible="true" Text="Administrativo"></asp:Label>
                </div>
                <div class="col-md-6">
                    <asp:Label runat="server" ID="LblOpcionDocente" Visible="true" Text="Docente"></asp:Label>
                </div>
            </div>
        </div>
    </div>
    <div class="mx-auto mt-5">
        <div class="form-group">
            <div class="form-row">

                <div class="col-md-4">
                    <asp:Label runat="server" ID="Lblmodalidadtrabajador" Visible="true" Text="MODALIDAD DE TRABAJADOR"></asp:Label>
                </div>
                <div class="col-md-2">
                </div>
                <div class="col-md-4">
                    <asp:Label runat="server" ID="Lblmodalidaddocente" Visible="true" Text="MODALIDAD DE DOCENTE"></asp:Label>
                </div>
                <div class="col-md-2">
                </div>
            </div>
        </div>
    </div>
    <!-- -->
    <div class="mx-auto mt-5">
        <div class="form-group">
            <div class="form-row">

                <div class="col-md-3">
                    <asp:Label runat="server" ID="lblfoto" Visible="true" Text="SUBIR FOTO"></asp:Label>
                </div>
                <div class="col-md-4">
                    <asp:Label runat="server" ID="lblmodalidadcontratacion" Visible="true" Text="Modalidad de contratacion"></asp:Label>
                </div>
                <div class="col-md-2">
                    <asp:Label runat="server" ID="lblfechaingreso" Visible="true" Text="Fecha de ingreso"></asp:Label>
                    <asp:TextBox runat="server" ID="txtfechaingreso" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <asp:Label runat="server" ID="lblfecharetiro" Visible="true" Text="Fecha de retiro"></asp:Label>
                    <asp:TextBox runat="server" ID="txtfecharetiro" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <!-- -->
    <div class="mx-auto mt-5">
        <div class="form-group">
            <div class="form-row">

                <div class="col-md-2">
                    <asp:Label runat="server" ID="lblcargoingresa" Visible="true" Text="Cargo al que ingresa"></asp:Label>
                </div>
                <div class="col-md-9">
                    <asp:TextBox runat="server" ID="txtcargoingresa" CssClass="form-control"></asp:TextBox>
                </div>

            </div>
        </div>
    </div>
    <!-- -->
    <div class="mx-auto mt-5">
        <div class="form-group">
            <div class="form-row">

                <div class="col-md-2">
                    <asp:Label runat="server" ID="lbldepartamento" Visible="true" Text="Departamento"></asp:Label>
                </div>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtcargo" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    <asp:Label runat="server" ID="Lblsalario" Visible="true" Text="salario"></asp:Label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox runat="server" ID="Txtsalario" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <!--espacio -->
    <div class="mx-auto mt-5">
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-12">
                    <asp:Label runat="server" ID="Label3" Visible="true" ></asp:Label>
                </div>
                <div class="col-md-12">
                    <h3 class="text-center">USO EXCLUSIVO DEL TRABAJADOR</h3>
                </div>
                <div class="col-md-12">
                    <asp:Label runat="server" ID="Label2" Visible="true" ></asp:Label>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
