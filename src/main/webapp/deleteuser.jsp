<%@page import="com.test.dao.UserDao"%>
<jsp:useBean id="u" class="com.test.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
UserDao.delete(u);
response.sendRedirect("viewusers.jsp");
%>