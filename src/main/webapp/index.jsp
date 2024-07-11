
<%@page import="com.tme.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0 ">

<title>TeachMate</title>
<%@include file="component/allcss.jsp"%>


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
	<%@include file="component/navbar.jsp"%>

	<!-- Video Section -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- Código de inserción del video -->
				<video width="100%" height="100%" autoplay muted loop>
					<source src="video/promoc.mp4" type="video/mp4">
				</video>
			</div>
		</div>
	</div>





	<!-- First Div Container -->
	<div class="container p-3">
		<p class="text-center mt-2 mb-5 fs-2 myP-color">""POTENCIA TU
			APRENDIZAJE CON TEACHMATE""</p>
		<div class="row">
			<!-- 1st col -->
			<div class="col-md-8 p-5">

				<div class="row">
					<div class="col-md-6">
						<div class="card my-card bg-warning">
							<div class="card-body">
								<p class="fs-5 myP-color">100% Confianza</p>
								<p>Conecta con la red más grande de los mejores y más
									brillantes tutores educativos. Ofrecemos tutorías compasivas
									respaldadas por una experiencia excepcional.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card my-card bg-info">
							<div class="card-body">
								<p class="fs-5 myP-color">Tecnología avanzada</p>
								<p>En TeachMate, lideramos la vanguardia en tecnologías de
									educación gracias a un equipo de excelencia. Nuestra innovación
									está transformando el aprendizaje.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mt-2">
						<div class="card my-card bg-success">
							<div class="card-body">
								<p class="fs-5 myP-color">Mejores resultados académicos</p>
								<p>Con nuestra vasta experiencia y ventaja tecnológica, en
									TeachMate nos comprometemos a ofrecerte constantemente los
									mejores resultados académicos.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mt-2">
						<div class="card my-card bg-danger">
							<div class="card-body">
								<p class="fs-5 myP-color">Más de 25 puntos de tutoría</p>
								<p>TeachMate tutorías es nuestra red líder en servicios de
									apoyo académico, con más de 25 puntos de contacto en todo el
									país para recibir el mejor apoyo educativo donde lo necesites.</p>
							</div>
						</div>
					</div>
				</div>


			</div>
			<!-- Fin of 1st col -->

			<!-- 2nd col -->

			<div class="col-md-4 mt-2 mys-card">
				<img class="container mt-3" alt="" src="img/img01.jpg"
					height="440px" width="470px">
			</div>

			<!-- Fin of 2nd col -->

		</div>
	</div>
	<!-- Fin of First Div Container -->


	<br>

	<!-- Carrusel code -->

	<div id="carouselExampleIndicators" class="container carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="3" aria-label="Slide 4"></button>
			<!-- <button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="4" aria-label="Slide 5"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="5" aria-label="Slide 6"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="6" aria-label="Slide 7"></button> -->
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/car1.jpg" class="d-block w-100" alt="..."
					height="400px">
			</div>
			<div class="carousel-item">
				<img src="img/car2.jpg" class="d-block w-100" alt="..."
					height="400px">
			</div>
			<div class="carousel-item">
				<img src="img/car3.jpg" class="d-block w-100" alt="..."
					height="400px">
			</div>
			<div class="carousel-item">
				<img src="img/img01.jpg" class="d-block w-100" alt="..."
					height="400px">
			</div>
			<!-- <div class="carousel-item">
					<img src="img/hospital1.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="img/hospital2.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="img/hospital3.jpg" class="d-block w-100" alt="...">
				</div> -->

		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<!-- Fin carrusel code -->

	<br>

	<!-- Second Div Container -->

	<div class="container p-2">
		<p class="text-center fs-2 myP-color">NUESTRO EQUIPO</p>
		<div class="row">
			<div class="col-md-3">
				<div class="card my-card">
					<div class="card-body text-center">
						<img alt="" src="img/p1.png" height="300px" width="230px">
						<p class="fw-bold fs-5">Prof. Mateo</p>
						<p class="fs-7">Área Matemáticas</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card my-card">
					<div class="card-body text-center">
						<img alt="" src="img/p2.png" height="300px" width="230px">
						<p class="fw-bold fs-5">Prof. Jesús</p>
						<p class="fs-7">Área Ciencias</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card my-card">
					<div class="card-body text-center">
						<img alt="" src="img/p3.png" height="300px" width="230px">
						<p class="fw-bold fs-5">Prof. Ana</p>
						<p class="fs-7">Área Letras</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card my-card">
					<div class="card-body text-center">
						<img alt="" src="img/p4.png" height="300px" width="230px">
						<p class="fw-bold fs-5">Prof. Gaby</p>
						<p class="fs-7">Área Idiomas</p>
					</div>
				</div>
			</div>

		</div>

	</div>

	<!-- Second Div Container -->


	<!-- Accordion code -->

	<div class="container accordion" id="accordionExample">
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseOne"
					aria-expanded="true" aria-controls="collapseOne">PROF. MATEO</button>
			</h2>
			<div id="collapseOne" class="accordion-collapse collapse show"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<strong>"¡Hola! Soy el profesor Mateo,</strong> encargado de
					enseñar el área de matemáticas con más de una década de experiencia
					en la enseñanza de las matemáticas, me enorgullezco de ser un
					facilitador del aprendizaje en este fascinante campo del
					conocimiento. Uilizo una variedad de enfoques
					<code>pedagógicos.</code>
					desde lecciones magistrales interactivas hasta actividades
					prácticas y proyectos de investigación. Me esfuerzo por adaptar mi
					enseñanza a las necesidades individuales de mis estudiantes y por
					proporcionar un apoyo adicional a aquellos que lo necesiten".
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseTwo"
					aria-expanded="false" aria-controls="collapseTwo">PROF. JESÚS</button>
			</h2>
			<div id="collapseTwo" class="accordion-collapse collapse"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<strong>"¡Saludos! Soy el profesor Jesús,</strong> encargado del
					área de ciencias. Con una sólida formación académica y una pasión
					por la ciencia, estoy comprometido a inspirar a mis estudiantes y
					hacer que el mundo de las ciencias sea emocionante y accesible para
					todos. Mi enfoque
					<code>didáctico</code>
					se centra en el aprendizaje activo y experiencial. Creo que la
					mejor manera de comprender la ciencia es a través de la
					experimentación y la exploración práctica. Por lo tanto, en mis
					clases, los estudiantes tienen la oportunidad de participar en
					experimentos, proyectos de investigación y actividades prácticas
					que les permiten aplicar los conceptos científicos en un contexto
					real".
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseThree"
					aria-expanded="false" aria-controls="collapseThree">PROF. ANA</button>
			</h2>
			<div id="collapseThree" class="accordion-collapse collapse"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<strong>"¡Hola! Soy la profesora Ana,</strong> tengo el privilegio
					de ser la encargada del área de letras. Con una profunda pasión por
					la literatura y el lenguaje, estoy comprometida a inspirar a mis
					estudiantes y a ayudarles a descubrir el maravilloso mundo de las
					letras. Mi enfoque
					<code>pedagógico</code>
					se centra en fomentar la apreciación por la literatura y en
					desarrollar habilidades de comunicación efectiva en mis
					estudiantes. Creo que la lectura y la escritura son herramientas
					poderosas que no solo nos permiten explorar diferentes mundos y
					perspectivas, sino también expresar nuestras propias ideas y
					emociones de manera clara y persuasiva.
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseFour"
					aria-expanded="true" aria-controls="collapseFour">PROF. GABY</button>
			</h2>
			<div id="collapseFour" class="accordion-collapse collapse"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<strong>"¡Saludos! Soy la profesora Gaby,</strong> encargada del área
					de idiomas. Con una pasión por los idiomas y la comunicación
					intercultural, estoy comprometida a ayudar a mis estudiantes a
					desarrollar habilidades lingüísticas sólidas y a apreciar la
					diversidad de lenguas y culturas en nuestro mundo. Mi enfoque
					<code>didáctico</code>
					se centra en el aprendizaje experiencial y comunicativo de los
					idiomas. Creo que la mejor manera de aprender un idioma es a través
					de la práctica activa y la inmersión en situaciones de la vida
					real. Por lo tanto, en mis clases, los estudiantes tienen la
					oportunidad de participar en actividades interactivas, juegos de
					roles y conversaciones en el idioma que están aprendiendo.
				</div>
			</div>
		</div>
	</div>

	<!-- Fin accordion code -->

	<!-- footer -->
	<%@include file="component/footer.jsp"%>
	<!-- Fin footer -->
</body>
</html>