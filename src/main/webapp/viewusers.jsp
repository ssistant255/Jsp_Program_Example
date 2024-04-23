<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.test.dao.UserDao" %>
<%@ page import="com.test.bean.User" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Users</title>
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
    <h1>Users List</h1>
    <%
    List<User> list = null;
    String errorMessage = null;
    try 
    {
        list = UserDao.getAllRecords();
    } 
    catch (Exception e)     
    {
        errorMessage = "An error occurred while fetching user records: " + e.getMessage();
    }
    %>
    <% if (errorMessage != null) 
    {
    %>
        <p><%= errorMessage %></p>
    <%
    }
    else
    { 
    %>
        <table border="1" width="90%">
            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Password</th>
                <th>Email</th>
                <th>Gender</th>
                <th>Country</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <% for (User u : list) 
            {
            %>
                <tr>
                    <td><%= u.getId() %></td>
                    <td><%= u.getName() %></td>
                    <td><%= u.getPassword() %></td>
                    <td><%= u.getEmail() %></td>
                    <td><%= u.getGender() %></td>
                    <td><%= u.getCountry() %></td>
                    <td><a href="editform.jsp?id=<%= u.getId() %>">Edit</a></td>
                    <td><a href="deleteuser.jsp?id=<%= u.getId() %>">Delete</a></td>
                </tr>
            <% 
            }
            %>
        </table>
    <% 
    }
    %>
    <br/><a href="adduserform.jsp">Add New User</a>
</body>
</html>