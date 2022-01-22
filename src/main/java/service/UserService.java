package service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Salle;
import beans.User;
import connexion.Connexion;
import dao.IDao;

public class UserService implements IDao<User> {

	@Override
	public boolean create(User o) {
		String sql = "insert into User values (null, ?,?,?,1,?)";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, o.getUsername());
			ps.setString(2, o.getMail());
			ps.setString(3, o.getPassword());
			ps.setInt(4, o.getType());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("create : erreur sql : " + e.getMessage());

		}
		return false;
	}

	@Override
	public boolean delete(User o) {
		String sql = "delete from User where id  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, o.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("delete : erreur sql : " + e.getMessage());

		}
		return false;
	}

	@Override
	public boolean update(User o) {

		String sql = "update User set username  = ? , mail =?, password=? where id  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, o.getUsername());
			ps.setString(2, o.getMail());
			ps.setString(3, o.getPassword());
			ps.setInt(4,o.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("update : erreur sql : " + e.getMessage());

		}
		return false;
	}

	@Override
	public User findById(int id) {
		Salle s = null;
		String sql = "select * from User where id  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return new User(rs.getInt("id"), rs.getString("username"), rs.getString("mail"), rs.getString("password"),rs.getInt("status"),rs.getInt("type"));
			}

		} catch (SQLException e) {
			System.out.println("findById " + e.getMessage());
		}
		return null;
	}

	@Override
	public List<User> findAll() {
		List<User> users = new ArrayList<User>();

		String sql = "select * from User order by id desc";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				users.add(new User(rs.getInt("id"), rs.getString("username"), rs.getString("mail"),rs.getString("password"),rs.getInt("status"),rs.getInt("type")));
			}

		} catch (SQLException e) {
			System.out.println("findAll " + e.getMessage());
		}
		return users;
	}
	
	public List<User> findAllEx(String user) {
		List<User> users = new ArrayList<User>();

		String sql = "select * from User where username!=? order by id desc";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				users.add(new User(rs.getInt("id"), rs.getString("username"), rs.getString("mail"),rs.getString("password"),rs.getInt("status"),rs.getInt("type")));
			}

		} catch (SQLException e) {
			System.out.println("findAll " + e.getMessage());
		}
		return users;
	}
	
	public boolean Activer(User o) {

		String sql = "update User set status=1 where id  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1,o.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("update : erreur sql : " + e.getMessage());

		}
		return false;
	}
	
	public boolean Desactiver(User o) {

		String sql = "update User set status=0 where id  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1,o.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("update : erreur sql : " + e.getMessage());

		}
		return false;
	}
	
	public User Login(String mail,String password) {
		String sql = "select * from User where mail = ? and password=?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, mail);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return new User(rs.getInt("id"), rs.getString("username"), rs.getString("mail"), rs.getString("password"),rs.getInt("status"),rs.getInt("type"));
			}else {
				return new User(1, "Empty", "Empty", "Empty",0,0);
			}

		} catch (SQLException e) {
			System.out.println("findById " + e.getMessage());
		}
		return null;
	}
	
	public User Forgot(String email) {
		String sql = "SELECT * FROM user where mail=?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return new User(rs.getInt("id"), rs.getString("username"), rs.getString("mail"), rs.getString("password"),rs.getInt("status"),rs.getInt("type"));
			}else {
				return new User(1, "Empty", "Empty", "Empty",0,0);
			}

		} catch (SQLException e) {
			System.out.println("findById " + e.getMessage());
		}
		return null;
	}
	
	

}
