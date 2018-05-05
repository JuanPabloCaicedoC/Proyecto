<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/Home.Master" AutoEventWireup="true" CodeBehind="Perfiles.aspx.cs" Inherits="Proyecto.Web.Views.Usuarios.Perfiles.Perfiles" %>

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
                        <b>PERFILES</b>
                        <asp:Label runat="server" ID="lblOpcion" Visible="false"></asp:Label>
                        <button type="button" data-toggle="modal" data-target="#modalPaginas" id="btnModalPaginas" hidden></button>
                    </h3>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-3">
                    <asp:Label runat="server" ID="lblCodigo" Text="Codigo Perfil"></asp:Label>
                    <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-6">
                    <asp:Label runat="server" ID="lblDescripcion" Text="Descripcion del Perfil"></asp:Label>
                    <asp:TextBox runat="server" ID="txtPerfil" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-12">
                    <asp:Button runat="server" ID="btnGuardar" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                    <asp:Button runat="server" ID="btnCancelar" Text="Cancelar" CssClass="btn btn-primary" OnClick="btnCancelar_Click" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-12">
                    <h4>
                        <b>Tabla Perfiles</b>
                    </h4>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-6" style="overflow: auto">
                    <asp:GridView runat="server" ID="gvwDatos"
                        Width="100%"
                        AutoGenerateColumns="false"
                        EmptyDataText="No se encontraron resultados"
                        CssClass="table table-bordered"
                        OnRowCommand="gvwDatos_RowCommand">

                        <Columns>
                            <asp:TemplateField HeaderText="Codigo">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblCodigo" Text='<%# Bind("perfCodigo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Descripcion" DataField="perfDescripcion" />

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

                            <%-- PAGINAS --%>

                            <asp:TemplateField HeaderText="Paginas">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibPaginas" runat="server" ImageUrl="~/Images/Pages.png" Width="26" Height="26"
                                        CommandName="Paginas" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    <!-- Logout Modal-->
    <div class="modal fade" id="modalPaginas" tabindex="-1" role="dialog" aria-labelledby="modalPaginas" aria-hidden="true">
        <%--<div>--%>
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%-- encabezado --%>
                    <h3>Elegir a que paginas va a tener permiso</h3>
                    <asp:Label runat="server" Visible="false" ID="lblCodPerfil"></asp:Label>
                </div>
                <div class="modal-body">
                    <%-- cuerpo --%>
                    <asp:GridView ID="gvwPaginas" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                        <Columns>
                            <asp:BoundField HeaderText="Codigo" DataField="pagiCodigo" />
                            <asp:BoundField HeaderText="Descripcion" DataField="pagiDescripcion" />
                            <asp:TemplateField HeaderText="Seleccionar">
                                <ItemTemplate>
                                    <asp:CheckBox runat="server" ID="chkSeleccionar" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="modal-footer">
                    <%-- pie de pagina --%>
                    <asp:Button runat="server" ID="btnGuardarPaginas" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardarPaginas_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

