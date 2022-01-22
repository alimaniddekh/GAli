<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="resetPass.EmailUtility"%>
<%@ page import="resetPass.Randomm"%>
<%@page import="beans.User"%>
<%@page import="service.UserService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot password</title>
</head>
<body>
	<%
	try {
		String mail = request.getParameter("mail");
		UserService us=new UserService();
		User u =us.Forgot(mail);
		if (mail.equals(u.getMail())) {
			String recipient=mail;
			
			
			String subject = "Your Password has been reset";


			String content = "Hi, this is your new password: " + u.getPassword();
			content += "\nNote: for security reason, " + "you must change your password after logging in.";

			String message = "";

			try {
				EmailUtility.send(content,recipient,subject);
				message = "Your password has been reset. Please check your e-mail.";
			} catch (Exception ex) {
				ex.printStackTrace();
				message = "There were an error: " + ex.getMessage();
			}
			
			
			out.println("Password send to your email id successfully !");
		} else {
			out.println("Invalid Email Id !");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	<button ><a href="login.jsp">login</a></button>
</body>
</html>