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
<title>Registro | Alumno</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- boostrap css -->
<%@include file="component/allcss.jsp"%>
<!-- end of boostrap css -->

<!-- CSS personalizado para esta página. -->
<style type="text/css">
.my-card {
	box-shadow: 0px 0px 10px 1px rgba(173, 216, 230, 1);
	/*box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.3);*/
}
</style>
<!-- Fin del CSS personalizado para esta página. -->

</head>
<body>
	<!-- navbar -->
	<%@include file="component/navbar.jsp"%>
	<!-- Fin navbar -->

	<!-- User Register -->
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card my-card">
					<div class="card-header text-center text-white" style="background-color: rgba(32, 190, 198);">
						<!-- <p class="fs-4 text-center mt-1"><i class="fa-solid fa-users"></i> <br>User Login</p> -->
						<p class="fs-4 text-center text-white mt-2">
							<i class="fa fa-user-plus"></i> Registro Alumno
						</p>
					</div>
					<div class="card-body">
						<!-- <p class="fs-4 text-center">User Register</p> -->

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

						<!-- boostrap form -->
						<form action="user_register" method="post">
							<div class="mb-3">
								<label class="form-label">Nombre completo</label> <input
									name="nombre" type="text" placeholder="Ingrese nombre completo"
									class="form-control">

							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input
									name="email" type="email" placeholder="Ingrese correo electronico"
									class="form-control">
								<div id="emailHelp" class="form-text">Nunca compartiremos
									tu email con cualquier otra persona.</div>
							</div>
							<div class="mb-3">
								<label class="form-label">Clave</label> <input
									name="clave" type="password" placeholder="Ingrese clave"
									class="form-control">
							</div>

							<button type="submit" class="btn text-white col-md-12" style="background-color: rgba(32, 190, 198);">Registrarse</button>
						</form>
						<!-- <br>¿No tienes una cuenta? <a href="#!" class="text-decoration-none">crea uno</a> -->
						<!-- Fin of boostrap form -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Fin of User Register -->

</body>
</html>