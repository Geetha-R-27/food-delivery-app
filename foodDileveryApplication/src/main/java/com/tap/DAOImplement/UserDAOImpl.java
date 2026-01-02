package com.tap.DAOImplement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.DBconnection.DBconnection;
import com.tap.DAO.UserDAO;
import com.tap.model.User;

public class UserDAOImpl implements UserDAO{
	private static final String INSERT_USER_QUERY ="INSERT into `user` (`name`,`email`,`password`,`phone`) values(?,?,?,?)";
	private static final String DELETE_USER_QUERY = "DELETE FROM `user` WHERE `userId`=?";
	private static final String GET_USER_QUERY = "SELECT * FROM `user` WHERE `id`=?";
	private static final String UPDATE_USER_QUERY = "UPDATE `user` SET `name` = ? `email`=? `password`=?  `phone`=?";
	private static final String GETALL_USER_QUERY = "SELECT * FROM `user`";
    User user=null;
	@Override
	public void addUser(User user) {

		
		try (Connection con = DBconnection.getConnection();
				PreparedStatement pstmt = con.prepareStatement(INSERT_USER_QUERY)){
			
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getPhone());
			
			int res = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public void deleteUser(int userId) {

		Connection connection = DBconnection.getConnection();
		try {
			PreparedStatement pstmt = connection.prepareStatement(DELETE_USER_QUERY);
			
		    pstmt.setInt(1, userId);
		    
		    pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Override
	public User getUser(int userId) {
		User user=null;
		
		try(Connection connection = DBconnection.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(GET_USER_QUERY);) {
			
			
			pstmt.setInt(1, userId);
			ResultSet res = pstmt.executeQuery();
			
			user = extractUser(res);		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return user;
	}
	@Override
	public void updateUser(User user) {

		Connection connection=null;
		try {
			connection = DBconnection.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(UPDATE_USER_QUERY);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getPhone());
			
			pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@Override
	public List<User> getAllUser() {
		ArrayList<User> userList = new ArrayList<User>();
		User user=null;
		try {
			Connection connection = DBconnection.getConnection();
			Statement pstmt = connection.createStatement();
			ResultSet res = pstmt.executeQuery(GETALL_USER_QUERY);
			while(res.next()) {
				
				 user = extractUser(res);
				userList.add(user);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return userList;
	}
	User extractUser(ResultSet res) throws SQLException{
		
		int userId=res.getInt("userId");
		String name=res.getString("name");
		String email=res.getString("email");
		String password=res.getString("password");
		String phone=res.getString("phone");
		user = new User(userId, name, email, password, phone);
		return user;
	}
}
