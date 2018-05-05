<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/Home.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Proyecto.Web.Views.Convocatorias.Registro.Registro" %>

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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">

    <div class="mx-auto mt-5">
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-12">
                    <h3>
                        <b>CREACION DE CONVOCATORIA</b>
                    </h3>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-12">
                    <asp:Label runat="server" ID="lblDescripcion" Text="Descripcion"></asp:Label>
                    <asp:TextBox runat="server" TextMode="multiline" ID="txtDescripcion" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-12">
                    <asp:Label runat="server" ID="lblRangoSalarial" Text="Rango Salarial"></asp:Label>
                </div>
                <div class="form-group mb-3">
                    <asp:TextBox runat="server" ID="txtPrimerValor" CssClass="form-control" placeholder="Min"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtSegundoValor" CssClass="form-control" placeholder="Max"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-12">
                    <asp:Label runat="server" ID="lblFunciones" Text="Funciones"></asp:Label>
                    <asp:TextBox runat="server" TextMode="multiline" ID="txtFunciones" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="form-group mb-2">
                    <asp:Label runat="server" ID="lblVacantes" Text="Cantidad de vacantes"></asp:Label>
                </div>
                <div class="col-md-2">
                    <asp:TextBox runat="server" ID="txtVacantes" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-12">
                    <h4>
                        <b>Requerimientos</b>
                    </h4>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="form-group mb-2">
                    <asp:Label runat="server" ID="Label1" Text="Educación mínima"></asp:Label>
                </div>
                <div class="col-md-2">
                    <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="form-group mb-2">
                    <asp:Label runat="server" ID="Label2" Text="Años de experiencia"></asp:Label>
                </div>
                <div class="col-md-2">
                    <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="form-group mb-2">
                    <asp:Label runat="server" ID="Label3" Text="Disponibilidad de viajar"></asp:Label>
                </div>
                <div class="col-md-2">
                    <asp:DropDownList runat="server" ID="ddlDisponibilidad" CssClass="form-control">
                        <asp:ListItem>Si</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="form-group mb-2">
                    <asp:Label runat="server" ID="Label4" Text="Disponibilidad de cambio de residencia"></asp:Label>
                </div>
                <div class="col-md-2">
                    <asp:DropDownList runat="server" ID="ddlDisponibilidadResidencia" CssClass="form-control">
                        <asp:ListItem>Si</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-12">
                    <asp:Button runat="server" ID="btnGuardar" Text="Guardar" CssClass="btn btn-primary"/>
                    <asp:Button runat="server" ID="btnCancelar" Text="Cancelar" CssClass="btn btn-primary"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
