<%@page import="javax.swing.WindowConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="beans.User"%>
<%@page import="service.UserService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Validate</title>
</head>
<body>

	<%
	UserService us = new UserService();
	String mail = request.getParameter("mail");
	String password = request.getParameter("password");
	User u = us.Login(mail, password);
	if (mail.equals(u.getMail()) && password.equals(u.getPassword())) {
		if (u.getStatus() == 0) {
			session.setAttribute("Error", "Votre Compte est desactiver");
			response.sendRedirect("login.jsp");
		} else {
			session.setAttribute("user", u.getUsername());
			session.setAttribute("id", u.getType());
			session.setAttribute("Error", "");
			response.sendRedirect("Dashboard.jsp");
		}

	} else if (u.getMail() == "Empty") {
		session.setAttribute("Error", "Email ou le Mot de passe est Incorect");
		response.sendRedirect("login.jsp");
	}
	%>
</body>
</html>
