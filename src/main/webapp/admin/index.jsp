<%@page import="com.tme.db.DBConnection"%>
<%@page import="com.tme.dao.DocenteDAO"%>
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
<title>Vista Administrador</title>
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

	<!-- La sesión de adminObj se mantiene si "adminObj" está vacío, luego inicie sesión primero...-->
	<!-- nadie puede acceder al panel de administración sin iniciar sesión como administrador-->
	<c:if test="${empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>



	<div class="container p-5">
		<p class="text-center text-dark fs-3">Panel Administrador</p>

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

		<!-- crear conexión con db y otros -->
		<% 
		DocenteDAO docDAO = new DocenteDAO(DBConnection.getConn());
		int totalNumberOfDocente = docDAO.countTotalDocente();
		int totalNumberOfUser = docDAO.countTotalUser();
		int totalNumberOfTutoria = docDAO.countTotalTutoria();
		int totalNumberOfEspecialidad = docDAO.countTotalEspecialidad();
		%>

		<!-- row-1 -->
		<div class="row">
			<div class="col-md-4">
				<div class="card my-card">
					<div class="card-body text-center text-dark">
						<i class="fa-solid fa-chalkboard-user fa-3x"></i><br>
						<p class="fs-4 text-center">
							Profesor <br><%= totalNumberOfDocente %>

						</p>
					</div>
				</div>

			</div>
			<div class="col-md-4">
				<div class="card my-card">
					<div class="card-body text-center text-dark">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">
							Alumno <br><%= totalNumberOfUser %>
						</p>
					</div>
				</div>

			</div>
			<div class="col-md-4">
				<div class="card my-card">
					<div class="card-body text-center text-dark">
						<i class="fa-solid fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Tutoria total <br><%= totalNumberOfTutoria %>
						</p>
					</div>
				</div>

			</div>
			<div class="col-md-4 mt-2">
				<div class="card my-card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-dark">
						<i class="fa-solid fa-book fa-3x"></i><br>
						<p class="fs-4 text-center">
							Especialidad <br><%= totalNumberOfEspecialidad %>
						</p>
					</div>
				</div>

			</div>
		</div>


	</div>



	<!-- especialidad modal -->



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-dark" id="exampleModalLabel">Agregar
						Especialidad</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="../addEspecialidad" method="post">

						<div class="form-group">
							<label class="form-label">Ingrese nombre de la especialidad</label> <input
								type="text" name="especialidadNombre"
								placeholder="Nombre de la especialidad" class="form-control" />
						</div>
						<div class="text-center mt-2">
							<button type="submit" class="btn btn-outline-danger ">Añadir</button>
						</div>

					</form>



				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">Cerrar</button>

				</div>
			</div>
		</div>
	</div>

	<!-- fin especialidad modal -->





</body>
</html>