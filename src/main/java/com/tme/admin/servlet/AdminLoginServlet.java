package com.tme.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tme.modal.User;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			//crear un administrador estático para este proyecto
			String email = req.getParameter("email");
			String clave = req.getParameter("clave");
			
			HttpSession session = req.getSession();
			
			//lógica para un administrador estático
			if ("admin@gmail.com".equals(email) && "admin".equals(clave)) {
				
				//Si el obj "adminObj" está disponible, proporciona acceso a la página de administración,
				//de lo contrario, "adminObj" no está presente en obj, entonces otros usuarios que inician sesión no tendran acceso de administrador.
				//¡La línea a continuación verifica especialmente si el administrador ha iniciado sesión o no! 
				//El objeto "adminObj" está disponible, lo que significa que el administrador ha iniciado sesión.
				session.setAttribute("adminObj", new User());
				resp.sendRedirect("admin/index.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Usuario o contraseña inválido.");
				resp.sendRedirect("admin_login.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
