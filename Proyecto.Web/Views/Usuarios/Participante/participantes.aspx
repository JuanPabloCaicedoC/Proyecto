<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/Home.Master" AutoEventWireup="true" CodeBehind="participantes.aspx.cs" Inherits="Proyecto.Web.Views.Usuarios.Participante.participantes" %>

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
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <nav aria-label="breadcrumb">
                    <ul class="breadcrumb nav nav-pills" role="tablist">
                        <li class="breadcrumb-item">
                            <a class="" href="#seccion1" aria-controls="" data-toggle="tab" role="tab">
                                <i class="fa fa-fas fa-user"></i>
                                <span class="">Parte 1</span>
                            </a>
                        </li>
                         <li class="breadcrumb-item">
                            <a class="" href="#seccion2" aria-controls="" data-toggle="tab" role="tab">
                                <i class="fa fa-fas fa-wpforms"></i>
                                <span class="">Parte 2</span>
                            </a>
                        </li>
                         <li class="breadcrumb-item">
                            <a class="" href="#seccion3" aria-controls="" data-toggle="tab" role="tab">
                                <i class="fa fa-fas fa-user"></i>
                                <span class="">Parte 3</span>
                            </a>
                        </li>
                         <li class="breadcrumb-item">
                            <a class="" href="#seccion4" aria-controls="" data-toggle="tab" role="tab">
                                <i class="fa fa-fas fa-user"></i>
                                <span class="">Parte 4</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="seccion1">
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
                                    <div class="col-md-1">
                                    </div>
                                    <div class="col-md-4">
                                        <asp:CheckBox runat="server" ID="checkboxadministrador" />
                                        <asp:Label runat="server" ID="lblOpcionAdministrativo" Visible="true" Text="Administrativo"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                    <div class="col-md-4">
                                        <asp:CheckBox runat="server" ID="checkboxdocente" />
                                        <asp:Label runat="server" ID="LblOpcionDocente" Visible="true" Text="Docente"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mx-auto mt-5">
                            <div class="form-group">
                                <div class="form-row">

                                    <div class="col-md-4">
                                        <asp:Label runat="server" CssClass="front-control" ID="Lblmodalidadtrabajador" Visible="true" Text="MODALIDAD DE TRABAJADOR"></asp:Label>

                                        <asp:DropDownList runat="server" CssClass="form-control" ID="dropdownMenumodalidadtrabajador">
                                            <asp:ListItem>Directivo</asp:ListItem>
                                            <asp:ListItem>Administrativo</asp:ListItem>
                                            <asp:ListItem>Operacional</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label runat="server" ID="Label1" Visible="true" Text="MODALIDAD DE DOCENTE"></asp:Label>
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="dropdownmodalidadtrabajador">
                                            <asp:ListItem>Tiempo Completo</asp:ListItem>
                                            <asp:ListItem>Medio Tiempo</asp:ListItem>
                                            <asp:ListItem>Hora Catedra</asp:ListItem>
                                            <asp:ListItem>Adjunto</asp:ListItem>
                                        </asp:DropDownList>
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

                                    <div class="col-md-2">
                                        <asp:Label runat="server" ID="lblfoto" Visible="true" Text="SUBIR FOTO"></asp:Label>
                                    </div>
                                    <div class="col-md-5">
                                        <asp:Label runat="server" ID="lblmodalidadcontratacion" Visible="true" Text="Modalidad de contratacion"></asp:Label>
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="dropdownMenucontratacion">
                                            <asp:ListItem>Termino fijo</asp:ListItem>
                                            <asp:ListItem>Termino indefinido</asp:ListItem>
                                            <asp:ListItem>Prestacion de servicios</asp:ListItem>
                                        </asp:DropDownList>
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
                                    <div class="col-md-4">
                                        <asp:TextBox runat="server" ID="txtcargo" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-1">
                                        <asp:Label runat="server" ID="Lblsalario" Visible="true" Text="Salario"></asp:Label>
                                    </div>
                                    <div class="col-md-5">
                                        <asp:TextBox runat="server" ID="Txtsalario" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div role="tab" class="tab-pane" id="seccion2">
                        <!--espacio -->
                        <div class="mx-auto mt-5">
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12">
                                        <asp:Label runat="server" ID="Label3" Visible="true"></asp:Label>
                                    </div>
                                    <div class="col-md-12">
                                        <h3 class="text-center">USO EXCLUSIVO DEL TRABAJADOR</h3>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Label runat="server" ID="Label2" Visible="true"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--identificacion -->
                        <div class="mx-auto mt-5">
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12">
                                        <h6 class="text-center">IDENTIFICACION</h6>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label runat="server" ID="lblprimernombre" Visible="true" Text="Primer nombre"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtprimernombre" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label runat="server" ID="lblsegundonombre" Visible="true" Text="Segundo nombre"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtsegundonombre" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label runat="server" ID="lblprimerapellido" Visible="true" Text="Primer apellido"></asp:Label>
                                        <asp:TextBox runat="server" ID="Tetxtsegundonombre" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label runat="server" ID="lblsegundoapellido" Visible="true" Text="Segundo apellido"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtsegundoapellido" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label runat="server" ID="lblfechadenacimiento" Visible="true" Text="Fecha de nacimiento"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtfechadenacimiento" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label runat="server" ID="lbledad" Visible="true" Text="Edad"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtedad" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Label runat="server" ID="lbllugardenacimiento" Visible="true" Text="Lugar de nacimiento"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtlugardenacimiento" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label runat="server" ID="lbldocumentoidentidad" Visible="true" Text="Documento de identidad"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtdocumentoidentidad" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label runat="server" ID="lbllugarexpedicion" Visible="true" Text="Lugar expedicion"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtlugarexpedicion" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Label runat="server" ID="lblcorreoelectronico" Visible="true" Text="Correo electronico"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtcorreoelectronico" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--idenformacion familiar -->
                        <div class="mx-auto mt-5">
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12">
                                        <h6 class="text-center">INFORMACION FAMILIAR</h6>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Label runat="server" ID="lblnombredelpadre" Visible="true" Text="Nombre del padre"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtnombredelpadre" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Label runat="server" ID="lblnombredelamadre" Visible="true" Text="Nombre de la madre"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtnombredelamadre" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Label runat="server" ID="lblnombreconyugueocompañero" Visible="true" Text="Nombre del conyugue o compañero"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtnombreconyugueocompañero" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Label runat="server" ID="lblnumerohijos" Visible="true" Text="Numero de hijos"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtnumerodehijos" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-10">
                                        <asp:Label runat="server" ID="lblnombres" Visible="true" Text="Nombres"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtnombres" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--domicilio -->
                        <div class="mx-auto mt-5">
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12">
                                        <h6 class="text-center">DOMICILIO</h6>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lbldireccion" Visible="true" Text="Direccion"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtdireccion" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblcelular" Visible="true" Text="Celular"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtcelular" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblbarrio" Visible="true" Text="Barrio"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtbarrio" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lbltelefono" Visible="true" Text="Telefono"></asp:Label>
                                        <asp:TextBox runat="server" ID="txttelefono" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div role="tab" class="tab-pane " id="seccion3">
                        <!--ESTADO CIVIL -->
                        <div class="mx-auto mt-5">
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12">
                                        <h6 class="text-center">ESTADO CIVIL</h6>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblestadocivil" Visible="true" Text="Estado civil"></asp:Label>

                                        <asp:DropDownList runat="server" CssClass="form-control" ID="dropdownestadocivil">
                                            <asp:ListItem>Soltero</asp:ListItem>
                                            <asp:ListItem>Casado</asp:ListItem>
                                            <asp:ListItem>Union Libre</asp:ListItem>
                                            <asp:ListItem>Separado</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--seguridad social -->
                        <div class="mx-auto mt-5">
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12">
                                        <h6 class="text-center">SEGURIDAD SOCIAL</h6>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lbleps" Visible="true" Text="EPS"></asp:Label>
                                        <asp:TextBox runat="server" ID="txteps" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblfondodepensiones" Visible="true" Text="Fondo de pensiones"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtfondodepensiones" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblarl" Visible="true" Text="ARL"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtarl" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblcajadecompensacion" Visible="true" Text="Caja de compensacion"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtcajadecompensacion" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblcesantias" Visible="true" Text="Cesantias"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtcesantias" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--nivel de estudios -->
                        <div class="mx-auto mt-5">
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12">
                                        <h6 class="text-center">NIVEL DE ESTUDIOS</h6>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblniveldeestudios" Visible="true" Text="Nivel de estudios"></asp:Label>
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="dropdownnivelestudios">
                                            <asp:ListItem>Bachillerato</asp:ListItem>
                                            <asp:ListItem>Tecnologico</asp:ListItem>
                                            <asp:ListItem>Tecnico</asp:ListItem>
                                            <asp:ListItem>Universitario</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Perfil profesional -->
                        <div class="mx-auto mt-5">
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12">
                                        <h6 class="text-center">PERFIL PROFESIONAL</h6>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Label runat="server" ID="lblprofesion" Visible="true" Text="Profesion"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtprofesion" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Label runat="server" ID="lblocupacion" Visible="true" Text="Ocupacion"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtocupacion" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Label runat="server" ID="lbltitulosobtenido" Visible="true" Text="Otros titulos obtenidos"></asp:Label>
                                        <asp:TextBox runat="server" ID="txttitulosobtenidos" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12">
                                        <h6 class="text-center">EXPERIENCIA EN DOCENCIA</h6>
                                    </div>
                                    <div class="col-md-4">
                                        <input type="checkbox" class="form-check-input" id="checkboxpublicacioneseninvestigacion">
                                        <asp:Label runat="server" ID="lblpublicacioneseninvestigacion" Visible="true" Text="Publicaciones en investigacion"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <input type="checkbox" class="form-check-input" id="checkboxproyectossocialesn">
                                        <asp:Label runat="server" ID="lblproyectosociales" Visible="true" Text="Proyectos sociales o con el sector externo"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <input type="checkbox" class="form-check-input" id="checkboxexperienciadocencia">
                                        <asp:Label runat="server" ID="lblexperienciaendocencia" Visible="true" Text="Experiencia en docencia"></asp:Label>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Label runat="server" ID="lbldescripcionseleccion" Visible="true" Text="Breve descripcion de lo seleccionado anteriormente"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtdescipcionseleccion" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Label runat="server" ID="lblcvlac" Visible="true" Text="Codigo CVLAC"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtcvlac" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane " id="seccion4">

                        <!--Antecedentes laborales -->
                        <div class="mx-auto mt-5">
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12">
                                        <h6 class="text-center">ANTECEDENTES LABORALES</h6>
                                    </div>
                                    <div class="col-md-12">
                                        <h8 class="text-center">INDICAR EMPLEOS EN ORDEN CRONOLOGICO</h8>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Label runat="server" ID="lblrazonsocial" Visible="true" Text="Razon social"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtrazonsocial" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblfechaingresotrabajo" Visible="true" Text="Fecha ingreso"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtfechaingresotrabajo" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblfecharetirotrabajo" Visible="true" Text="Fecha retiro"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtfecharetirotrabajo" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblcargodesempeñado" Visible="true" Text="Cargo desempeñado"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtcargodesempeñado" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblmotivoretiro" Visible="true" Text="Motivo de retiro"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtmotivoretiro" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Antecedentes laborales 2 -->
                        <div class="mx-auto mt-5">
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12">
                                        <asp:Label runat="server" ID="lblrazonsocial2" Visible="true" Text="Razon social"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtrazonsocial2" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblfechaingresotrabajo2" Visible="true" Text="Fecha ingreso"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtfechaingresotrabajo2" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblfecharetirotrabajo2" Visible="true" Text="Fecha retiro"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtfecharetirotrabajo2" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblcargodesempeñado2" Visible="true" Text="Cargo desempeñado"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtcargodesempeñado2" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblmotivoretiro2" Visible="true" Text="Motivo de retiro"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtmotivoretiro2" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Antecedentes laborales 3 -->
                        <div class="mx-auto mt-5">
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12">
                                        <asp:Label runat="server" ID="lblrazonsocial3" Visible="true" Text="Razon social"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtrazonsocial3" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblfechaingresotrabajo3" Visible="true" Text="Fecha ingreso"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtfechaingresotrabajo3" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblfecharetirotrabajo3" Visible="true" Text="Fecha retiro"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtfecharetirotrabajo3" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblcargodesempeñado3" Visible="true" Text="Cargo desempeñado"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtcargodesempeñado3" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server" ID="lblmotivoretiro3" Visible="true" Text="Motivo de retiro"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtmotivoretiro3" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Referencias personales -->
                        <div class="mx-auto mt-5">
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12">
                                        <h6 class="text-center">REFERENCIAS PERSONALES</h6>
                                    </div>
                                    <div class="col-md-12">
                                        <h8 class="text-center">MENCIONAR DOS PERSONAS QUE NO SEAN PARIENTES</h8>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label runat="server" ID="lblnombrereferenciapersonal" Visible="true" Text="Apellidos y nombres"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtnombrereferenciapersonal" CssClass="form-control"></asp:TextBox>
                                        <asp:TextBox runat="server" ID="txtnombrereferenciapersonal2" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label runat="server" ID="lbldireccionreferenciapersonal" Visible="true" Text="Direccion"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtDireccionreferenciapersonal" CssClass="form-control"></asp:TextBox>
                                        <asp:TextBox runat="server" ID="txtDireccionreferenciapersonal2" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label runat="server" ID="lbltelefonoreferenciapersonal" Visible="true" Text="Telefono"></asp:Label>
                                        <asp:TextBox runat="server" ID="txttelefonoreferenciapersonal" CssClass="form-control"></asp:TextBox>
                                        <asp:TextBox runat="server" ID="txttelefonoreferenciapersonal2" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label runat="server" ID="lblocupacionreferenciapersonal" Visible="true" Text="Ocupacion"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtocupacionreferenciapersonal" CssClass="form-control"></asp:TextBox>
                                        <asp:TextBox runat="server" ID="txtocupacionreferenciapersonal2" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Referencias familiares -->
                        <div class="mx-auto mt-5">
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12">
                                        <h6 class="text-center">REFERENCIAS FAMILIARES</h6>
                                    </div>
                                    <div class="col-md-12">
                                        <h8 class="text-center">MENCIONAR DOS REFENCIAS FAMILIARES</h8>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label runat="server" ID="lblnombrereferenciafamiliar" Visible="true" Text="Apellidos y nombres"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtnombrereferenciafamiliar" CssClass="form-control"></asp:TextBox>
                                        <asp:TextBox runat="server" ID="txtnombrereferenciafamiliar2" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label runat="server" ID="lbldireccionferenciafamiliar" Visible="true" Text="Direccion"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtdireccionferenciafamiliar" CssClass="form-control"></asp:TextBox>
                                        <asp:TextBox runat="server" ID="txtdireccionferenciafamiliar2" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label runat="server" ID="lbltelefonoferenciafamiliar" Visible="true" Text="Telefono"></asp:Label>
                                        <asp:TextBox runat="server" ID="txttelefonoferenciafamiliar" CssClass="form-control"></asp:TextBox>
                                        <asp:TextBox runat="server" ID="txttelefonoferenciafamiliar2" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label runat="server" ID="lblocupacionferenciafamiliar" Visible="true" Text="Ocupacion"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtocupacionferenciafamiliar" CssClass="form-control"></asp:TextBox>
                                        <asp:TextBox runat="server" ID="txtocupacionferenciafamiliar2" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>

    </div>

</asp:Content>
