<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="DAL.Datahelper"%>
<%@page import="java.sql.*"%>    
<%
String q = request.getParameter("q")+"%";

Datahelper.connection();
ResultSet res=Datahelper.selectData("select * from frontdesk where fullname like '"+q+"' ");

out.print("<table>");
while(res.next())
{ %>
   <tr><td><%= res.getString(1)  %></td><td><%= res.getString(2)  %></td><td><%= res.getString(3)  %></td><td><%= res.getString(4)  %></td><td><a href="Editrec.jsp?q=<%= res.getString(1)  %>"><img src="edit.png" width="50" height="50" /></a></td><td><a href="Deleterec.jsp?q=<%= res.getString(1)  %>"><img src="del.jpg" width="50" height="50"/></a></td></tr>
<% }
Datahelper.closeConnection();
out.print("</table>");
%>
