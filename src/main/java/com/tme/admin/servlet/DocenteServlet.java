package com.tme.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tme.dao.DocenteDAO;
import com.tme.db.DBConnection;
import com.tme.modal.Docente;

@WebServlet("/addDocente")
public class DocenteServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			//obtener todos los datos que provienen de docente.jsp detalles del docente
			String nombre = req.getParameter("nombre");
			String fnacim = req.getParameter("fnacim");
			String calificacion = req.getParameter("calificacion");
			String especialidad = req.getParameter("especialidad");
			String email = req.getParameter("email");
			String telefono = req.getParameter("telefono");
			String clave = req.getParameter("clave");
			
			
			Docente docente = new Docente(nombre, fnacim, calificacion, especialidad, email, telefono, clave);
			
			DocenteDAO docDAO = new DocenteDAO(DBConnection.getConn());
			
			boolean f = docDAO.registerDocente(docente);

			HttpSession session = req.getSession();
			
			if(f==true) {
				session.setAttribute("successMsg", "Docente agregado con éxito");
				resp.sendRedirect("admin/docente.jsp");
				
			}
			else {
				session.setAttribute("errorMsg", "¡Algo salió mal en el servidor!");
				resp.sendRedirect("admin/docente.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
}
