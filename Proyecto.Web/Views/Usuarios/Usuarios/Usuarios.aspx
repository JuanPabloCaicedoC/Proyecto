<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/Home.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Proyecto.Web.Views.Usuarios.Usuarios.usuarios" %>

<asp:Content ID="ContentHeader" ContentPlaceHolderID="header" runat="server">

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

<asp:Content ID="Content1" ContentPlaceHolderID="contenido" runat="server">

    <div class="mx-auto mt-5">
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-12">
                    <h3>
                        <b>USUARIOS</b>
                        <asp:Label runat="server" ID="lblOpcion" Visible="false"></asp:Label>
                        <asp:Label runat="server" ID="lblCodUsuario" Visible="false"></asp:Label>
                        <button type="button" data-toggle="modal" data-target="#modalPaginas" id="btnModalPaginas" hidden></button>
                    </h3>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="form-group mb-2">
                    <asp:Label runat="server" ID="lblCodigo" Text="Codigo"></asp:Label>
                </div>
                <div class="col-md-2">
                    <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:Button runat="server" ID="btnBuscar" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click"/>
                    <asp:Button runat="server" ID="btnTodos" Text="Todos" CssClass="btn btn-primary" OnClick="btnTodos_Click"/>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-3">
                    <asp:Label runat="server" ID="lblNombre" Text="Nombre"></asp:Label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:Label runat="server" ID="lblApellido" Text="Apellido"></asp:Label>
                    <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label runat="server" ID="lblCorreo" Text="Correo"></asp:Label>
                    <asp:TextBox runat="server" ID="txtCorreo" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-3">
                    <asp:Label runat="server" ID="lblUsuario" Text="Usuario"></asp:Label>
                    <asp:TextBox runat="server" ID="txtUsuario" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:Label runat="server" ID="lblPassword" Text="Contraseña"></asp:Label>
                    <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label runat="server" ID="lblPerfiles" Text="Perfil"></asp:Label>
                    <asp:DropDownList runat="server" ID="ddlPerfiles" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-12">
                    <asp:Button runat="server" ID="btnGuardar" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click"/>
                    <asp:Button runat="server" ID="btnCancelar" Text="Cancelar" CssClass="btn btn-primary" OnClick="btnCancelar_Click"/>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-12">
                    <h4>
                        <b>Tabla Usuarios</b>
                    </h4>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-12" style="overflow: auto">
                    <asp:GridView runat="server" ID="gvwDatos"
                        Width="100%"
                        AutoGenerateColumns="false"
                        EmptyDataText="No se encontraron resultados"
                        CssClass="table table-bordered"
                        OnRowCommand="gvwDatos_RowCommand">

                        <Columns>
                            <asp:TemplateField HeaderText="Codigo">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblCodigo" Text='<%# Bind("usuCodigo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Nombre" DataField="usuNombre" />
                            <asp:BoundField HeaderText="Apellido" DataField="usuApellido" />
                            <asp:BoundField HeaderText="Email" DataField="usuEmail" />
                            <asp:BoundField HeaderText="Usuario" DataField="usuUsuario" />                           

                            <asp:BoundField HeaderText="Perfil" DataField="perfDescripcion" />
                             <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblPassword" Text='<%# Bind("usuPassword") %>'></asp:Label>
                                    <asp:Label runat="server" ID="lblPerfil" Text='<%# Bind("perfCodigo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%-- EDITAR --%>

                            <asp:TemplateField HeaderText="Editar">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibEditar" runat="server" ImageUrl="~/Images/Edit.png" Width="24" Height="24"
                                        CommandName="Editar" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <%--ELIMINAR--%>

                            <asp:TemplateField HeaderText="Eliminar">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibEliminar" runat="server" ImageUrl="~/Images/Remove.png" Width="24" Height="24"
                                        CommandName="Eliminar" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
