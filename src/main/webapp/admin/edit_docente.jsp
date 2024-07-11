<%@page import="com.tme.modal.Docente"%>
<%@page import="com.tme.dao.DocenteDAO"%>
<%@page import="com.tme.modal.Especialidad"%>
<%@page import="java.util.List"%>
<%@page import="com.tme.db.DBConnection"%>
<%@page import="com.tme.dao.EspecialidadDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- for jstl tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- end of jstl tag -->

<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor page</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%@include file="../component/allcss.jsp"%>

<!-- CSS personalizado para esta página. -->
<style type="text/css">
.my-card {
	box-shadow: 0px 0px 10px 1px rgb(175, 175, 175);
	/*box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.3);*/
}
</style>
<!-- Fin del CSS personalizado para esta página. -->

</head>
<body>
	<%@include file="navbar.jsp"%>


	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4 offset-4">
				<div class="card my-card">
					<div class="card-body">
						<p class="fs-3 text-center text-dark">Editar Profesor</p>

						<!-- message print -->
						<!-- for success msg -->
						<c:if test="${not empty successMsg}">
							<script>
								Swal.fire({
									icon : 'success',
									title : 'Éxito',
									text : '${successMsg}',
								});
							</script>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<!-- for error msg -->
						<c:if test="${not empty errorMsg}">
							<script>
								Swal.fire({
									icon : 'error',
									title : 'Error',
									text : '${errorMsg}',
								});
							</script>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<!-- End of message print -->



						<%
						//obtenga docente id especifico con la ayuda de request.getParameter() 
						//que proviene de la URL para la edición del docente (que paso a través de la URL cuando presiono editar docente)...
						int id = Integer.parseInt(request.getParameter("id")); //este "id" es el nombre del prefijo en la URL
						DocenteDAO docDAO = new DocenteDAO(DBConnection.getConn());
						Docente docente = docDAO.getDocenteById(id);//llame a getDocenteById(id) que regresa al docente con una identificación específica.
						%>

						<!-- boostrap form -->
						
						<!-- Formulario de detalles de los docentes con datos/detalles enviados por el id específico con un campo editable -->
						
						<form action="../updateDocente" method="post">
							<div class="mb-3">
								<label class="form-label">Nombre completo</label> <input
									name="nombre" type="text" placeholder="Ingrese nombre completo"
									class="form-control" value="<%=docente.getNombre()%>">

							</div>
							<div class="mb-3">
								<label class="form-label">Fecha de nacimiento</label> <input
									name="fnacim" type="date" placeholder="Ingrese fnacim"
									class="form-control" value="<%=docente.getFnacim()%>">

							</div>
							<div class="mb-3">
								<label class="form-label">Calificación</label> <input
									name="calificacion" type="text"
									placeholder="Ingrese calificacion" class="form-control"
									value="<%=docente.getCalificacion()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Especialidad</label> <select
									class="form-control" name="especialidad">
									<option><%=docente.getEspecialidad()%></option>

									<%
									EspecialidadDAO espDAO = new EspecialidadDAO(DBConnection.getConn());
									List<Especialidad> espList = espDAO.getAllEspecialidad();
									for (Especialidad esp : espList) {
									%>
									<option>
										<%=esp.getEspecialidadNombre()%>
									</option>
									<%
									}
									%>

								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input
									name="email" type="email" placeholder="Ingrese correo electronico"
									class="form-control" value="<%=docente.getEmail()%>">

							</div>
							<div class="mb-3">
								<label class="form-label">Telefono</label> <input name="telefono"
									type="text" placeholder="Ingrese telefono"
									class="form-control" value="<%=docente.getTelefono()%>">

							</div>
							<div class="mb-3">
								<label class="form-label">Clave</label> <input
									name="clave" type="text" placeholder="Ingrese clave"
									class="form-control" value="<%=docente.getClave()%>">
							</div>
							
							<!-- para actualizar los datos id usuario se utilizó la identificación "oculta -->
							<div class="mb-3">
								<input name="id" type="hidden" class="form-control"
									value="<%=docente.getId()%>">
							</div>

							<button type="submit" class="btn btn-dark text-white col-md-12">Actualizar</button>
						</form>
						<!-- <br>¿No tienes una cuenta? <a href="#!"
							class="text-decoration-none">crea uno</a> -->
						<!-- end of boostrap form -->

					</div>

				</div>
			</div>

		</div>
	</div>









</body>
</html>
