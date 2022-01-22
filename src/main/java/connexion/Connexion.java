package connexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connexion {

    private static String login = "yy3ul2t1rm7wowg0";
    private static String password = "f15d5zoj7lk2mq3z";
    private static String url = "jdbc:mysql://yy3ul2t1rm7wowg0:f15d5zoj7lk2mq3z@kutnpvrhom7lki7u.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/oci53e6lelq9xrqh";
    private Connection connection = null;
    private static Connexion instane;

    private Connexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, login, password);
        } catch (ClassNotFoundException e) {
            System.out.println("Driver introvable");
        } catch (SQLException e) {
            System.out.println("Connexion error");
            System.out.println(e.getMessage());
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public static Connexion getInstane() {
        if (instane == null) {
            instane = new Connexion();
        }
        return instane;
    }

}
