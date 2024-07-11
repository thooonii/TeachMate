package com.tme.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tme.dao.EspecialidadDAO;
import com.tme.db.DBConnection;

@WebServlet("/addEspecialidad")
public class EspecialidadServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String especialidadNombre = req.getParameter("especialidadNombre");
		
		 // Verificar si el nombre de la especialidad está vacío
        if (especialidadNombre == null || especialidadNombre.trim().isEmpty()) {
            HttpSession session = req.getSession();
            session.setAttribute("errorMsg", "Por favor, ingrese el nombre de la especialidad.");
            resp.sendRedirect("admin/index.jsp");
            return; // Detener la ejecución del método doPost
        }
	
		EspecialidadDAO especialidadDAO = new EspecialidadDAO(DBConnection.getConn());
		boolean f = especialidadDAO.addEspecialidad(especialidadNombre);
		
		HttpSession session = req.getSession();
		
		if (f==true) {
			session.setAttribute("successMsg", "Especialidad agregada con éxito");
			resp.sendRedirect("admin/index.jsp");
			
		} else {
			session.setAttribute("errorMsg", "¡Algo salió mal en el servidor!");
			resp.sendRedirect("admin/index.jsp");
		}
	}
	
	

}
