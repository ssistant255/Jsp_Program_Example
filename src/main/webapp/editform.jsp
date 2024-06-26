<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Form</title>
</head>
<style>
body
{
            background-image: url('https://wallpapercave.com/wp/wp9549965.jpg');
			background-repeat: no-repeat;
			background-size: cover;
            background-attachment: fixed;
}
</style>
<body>
<%@page import="com.test.dao.UserDao"%>
<%@page import="com.test.bean.User"%>
<%
String user_id = request.getParameter("id");
User u = UserDao.getRecordById(Integer.parseInt(user_id));
%>
<h1>Edit Form</h1>
<form action="edituser.jsp" method="post">
<input type="hidden" name="id" value="<%= u.getId() %>"/>
<table>
<tr><td>Name:</td><td><input type="text" name="name" value="<%= u.getName()%>"/></td></tr>
<tr><td>Password:</td><td><input type="password" name="password" value="<%= u.getPassword()%>"/></td></tr>
<tr><td>Email:</td><td><input type="email" name="email" value="<%= u.getEmail()%>"/></td></tr>
<tr><td>Gender:</td><td>
    <input type="radio" name="gender" value="Male" <%= u.getGender().equals("Male") ? "checked" : "" %>/>Male 
    <input type="radio" name="gender" value="Female" <%= u.getGender().equals("Female") ? "checked" : "" %>/>Female
</td></tr>
<tr><td>Country:</td><td>
<select name="country">
    <option <%= u.getCountry().equals("India") ? "selected" : "" %>>India</option>
    <option <%= u.getCountry().equals("Pakistan") ? "selected" : "" %>>Pakistan</option>
    <option <%= u.getCountry().equals("Afghanistan") ? "selected" : "" %>>Afghanistan</option>
    <option <%= u.getCountry().equals("Myanmar") ? "selected" : "" %>>Myanmar</option>
    <option <%= u.getCountry().equals("Other") ? "selected" : "" %>>Other</option>
</select>
</td></tr>
<tr><td colspan="2"><input type="submit" value="Edit User"/></td></tr>
</table>
</form>
</body>
</html>