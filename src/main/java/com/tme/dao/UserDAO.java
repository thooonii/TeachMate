package com.tme.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tme.modal.User;

public class UserDAO {

	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(User user) {

		boolean f = false;

		try {
			// insert user in db
			String sql = "insert into user_details(nombre, email, clave) values(?,?,?)";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getNombre());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getClave());

			pstmt.executeUpdate();

			f = true; // si la consulta se ejecuta correctamente, f se vuelve verdadera; de lo contrario, es falsa...

		} catch (Exception e) {
			e.printStackTrace();

		}

		return f;
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public boolean isUserRegistered(String email) {
		boolean userExists = false;
		try {
			// Preparar la consulta SQL para verificar si existe un usuario con el mismo correo electrónico
			String sql = "SELECT * FROM user_details WHERE email = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			// Ejecutar la consulta SQL
			ResultSet resultSet = pstmt.executeQuery();

			// Si se encuentra algún resultado, significa que el usuario ya está registrado
			if (resultSet.next()) {
				userExists = true;
			}

			// Cerrar recursos
			resultSet.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userExists;
	}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// cuando llama al método loginUser(), verifica que ese usuario en particular esté disponible o
	// si no está disponible, devuelva un objeto de usuario nulo.
	// y si un usuario en particular está disponible, cree un objeto de usuario (es decir, usuario) y busca.
	// Todos los datos de ese usuario db
	// y devolver ese objeto de usuarios específicos.
	public User loginUser(String email, String clave) {

		User user = null;

		try {
			String sql = "select * from user_details where email=? and clave=?";

			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, clave);

			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
				// si hay alguna fila disponible, obtenga los datos de esa fila...

				//crear un nuevo objeto de usuario
				user = new User();

				// recuperar datos uno por uno de la tabla db y configurarlos/vincularlos a los objetos del usuario.
				// por ejemplo, buscar ID y configurarlo como objeto de usuario
				// user.setId(resultSet.getInt(1));o debajo de la línea ambos son iguales
				// (1) significa número de índice 1 de colm de la tabla db, que es id
				// getString() toma tanto el número de índice de la columna como el nombre de la etiqueta de la columna...
				user.setId(resultSet.getInt("id"));
				user.setNombre(resultSet.getString("nombre"));
				user.setEmail(resultSet.getString("email"));
				user.setClave(resultSet.getString("clave"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;

	}

	//check old password
	public boolean checkOldPassword(int userId, String oldPassword) {

		boolean f = false;

		try {

			String sql = "select * from user_details where id=? and clave=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
			pstmt.setString(2, oldPassword);

			ResultSet resultSet = pstmt.executeQuery();
			//System.out.println(resultSet);
			while (resultSet.next()) {
				f = true;
			}
		

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	//change password
	public boolean changePassword(int userId, String newPassword) {

		boolean f = false;

		try {

			String sql = "update user_details set clave=? where id=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, newPassword);
			pstmt.setInt(2, userId);

			pstmt.executeUpdate();

			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
