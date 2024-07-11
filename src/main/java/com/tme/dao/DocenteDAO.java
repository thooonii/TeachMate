package com.tme.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import com.tme.modal.Docente;

public class DocenteDAO {

	private Connection conn;

	public DocenteDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean registerDocente(Docente docente) {

		boolean f = false;

		try {

			String sql = "insert into docente(nombre,fnacim,calificacion,especialidad,email,telefono,clave) values(?,?,?,?,?,?,?)";

			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, docente.getNombre());
			pstmt.setString(2, docente.getFnacim());
			pstmt.setString(3, docente.getCalificacion());
			pstmt.setString(4, docente.getEspecialidad());
			pstmt.setString(5, docente.getEmail());
			pstmt.setString(6, docente.getTelefono());
			pstmt.setString(7, docente.getClave());

			pstmt.executeUpdate();
			// si la consulta se insertó o todo ok
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// getAllDocente list
	public List<Docente> getAllDocente() {

		Docente docente = null;
		List<Docente> docList = new ArrayList<Docente>();

		try {

			String sql = "select * from docente order by id desc";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {
				docente = new Docente();

				docente.setId(resultSet.getInt("id"));
				docente.setNombre(resultSet.getString("nombre"));
				docente.setFnacim(resultSet.getString("fnacim"));
				docente.setCalificacion(resultSet.getString("calificacion"));
				docente.setEspecialidad(resultSet.getString("especialidad"));
				docente.setEmail(resultSet.getString("email"));
				docente.setTelefono(resultSet.getString("telefono"));
				docente.setClave(resultSet.getString("clave"));
				docList.add(docente);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return docList;
	}

	// obtener docente por id
	public Docente getDocenteById(int id) {

		Docente docente = null;

		try {

			String sql = "select * from docente where id=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, id);

			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {
				docente = new Docente();

				docente.setId(resultSet.getInt("id"));
				docente.setNombre(resultSet.getString("nombre"));
				docente.setFnacim(resultSet.getString("fnacim"));
				docente.setCalificacion(resultSet.getString("calificacion"));
				docente.setEspecialidad(resultSet.getString("especialidad"));
				docente.setEmail(resultSet.getString("email"));
				docente.setTelefono(resultSet.getString("telefono"));
				docente.setClave(resultSet.getString("clave"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return docente;
	}

	// actualizar docente por id
	public boolean updateDocente(Docente docente) {

		boolean f = false;

		try {

			String sql = "update docente set nombre=?,fnacim=?,calificacion=?,especialidad=?,email=?,telefono=?,clave=? where id=?";

			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, docente.getNombre());
			pstmt.setString(2, docente.getFnacim());
			pstmt.setString(3, docente.getCalificacion());
			pstmt.setString(4, docente.getEspecialidad());
			pstmt.setString(5, docente.getEmail());
			pstmt.setString(6, docente.getTelefono());
			pstmt.setString(7, docente.getClave());
			// Es necesario configurar id también para la actualización.
			pstmt.setInt(8, docente.getId());

			pstmt.executeUpdate();
			// Si la consulta está actualizada o todo ok.
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// eliminar docentes por id
	public boolean deleteDocenteById(int id) {

		boolean f = false;

		try {

			String sql = "delete from docente where id=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, id);

			pstmt.executeUpdate();

			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// inicio de sesión docente
	public Docente loginDocente(String email, String clave) {

		Docente docente = null;

		try {

			String sql = "select * from docente where email=? and clave=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			pstmt.setString(1, email);
			pstmt.setString(2, clave);

			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {
				docente = new Docente();

				/*
				 * docente.setId(resultSet.getInt("id"));
				 * docente.setNombre(resultSet.getString("nombre"));
				 * docente.setFnacim(resultSet.getString("fnacim"));
				 * docente.setCalificacion(resultSet.getString("calificacion"));
				 * docente.setEspecialidad(resultSet.getString("especialidad"));
				 * docente.setEmail(resultSet.getString("email"));
				 * docente.setTelefono(resultSet.getString("telefono"));
				 * docente.setClave(resultSet.getString("clave"));
				 */
				// Nosotros podemos escribir encima del código comentado o
				// de la siguiente manera [aquí 1 2 3..en serie están el número de índice 
				// de la columna de la tabla docente.
		

				docente.setId(resultSet.getInt(1));
				docente.setNombre(resultSet.getString(2));
				docente.setFnacim(resultSet.getString(3));
				docente.setCalificacion(resultSet.getString(4));
				docente.setEspecialidad(resultSet.getString(5));
				docente.setEmail(resultSet.getString(6));
				docente.setTelefono(resultSet.getString(7));
				docente.setClave(resultSet.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return docente;

	}

	// mostrar el número total de valores dinámicos en el panel de administración

	// método de recuento aquí para reducir la línea de código...
	// Contar el número total de docente
	public int countTotalDocente() {

		int i = 0;

		try {

			String sql = "select * from docente";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	// Contar el número total de tutorias.
	public int countTotalTutoria() {

		int i = 0;

		try {

			String sql = "select * from tutoria";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	// el número total de tutorias para un docente específico.
	public int countTotalTutoriaByDocenteId(int docenteId) {

		int i = 0;

		try {

			String sql = "select * from tutoria where docenteId=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, docenteId);

			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	// Contar el número total de usuarios
	public int countTotalUser() {

		int i = 0;

		try {

			String sql = "select * from user_details";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	// Contar el número total de especialidades
	public int countTotalEspecialidad() {

		int i = 0;

		try {

			String sql = "select * from especialidad";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	// comprobar la contraseña anterior
	public boolean checkOldPassword(int docenteId, String oldPassword) {

		boolean f = false;

		try {

			String sql = "select * from docente where id=? and clave=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, docenteId);
			pstmt.setString(2, oldPassword);

			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// cambiar la contraseña
	public boolean changePassword(int docenteId, String newPassword) {

		boolean f = false;

		try {

			String sql = "update docente set clave=? where id=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, newPassword);
			pstmt.setInt(2, docenteId);

			pstmt.executeUpdate();

			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// editar perfil de docente en el panel de docentes editar perfil.
	public boolean editDocenteProfile(Docente docente) {

		boolean f = false;

		try {

			//String sql = "update docente set nombre=?,fnacim=?,calificacion=?,especialidad=?,email=?,telefono=?,clave=? where id=?";
			String sql = "update docente set nombre=?,fnacim=?,calificacion=?,especialidad=?,email=?,telefono=? where id=?";

			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, docente.getNombre());
			pstmt.setString(2, docente.getFnacim());
			pstmt.setString(3, docente.getCalificacion());
			pstmt.setString(4, docente.getEspecialidad());
			pstmt.setString(5, docente.getEmail());
			pstmt.setString(6, docente.getTelefono());
			//pstmt.setString(7, docente.getPassword());
			// Es necesario configurar id también para la actualización.
			pstmt.setInt(7, docente.getId());

			pstmt.executeUpdate();
			//si la consulta está actualizada o todo está bien.
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
