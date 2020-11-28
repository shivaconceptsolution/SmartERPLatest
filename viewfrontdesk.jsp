<%@page import="DAL.Datahelper"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>

<div id="middle">
<div class="part1">
<%@include file="sidebar.jsp" %>
</div>

<div class="part2">
<center>
<form action="">
   <input type="text" name="txtstart" placeholder="enter start date"  />
   <input type="text" name="txtend" placeholder="enter enddate"  />
   <br>
   <input type="submit" name="btnsubmit" value="Search" />
   
</form>
</center>
<table border="1">
<tr><th colspan="6"><h1>VIEW FRONT DESK RECORD</h1></th></tr>
<tr><th>Username</th><th>Password</th><th>Mobileno</th><th>Fullname</th><th>Update</th><th>Remove</th></tr>
<%
//Class.forName("com.mysql.jdbc.Driver");
//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smarterp","root","");
//Statement st = con.createStatement();
//ResultSet res = st.executeQuery("select * from frontdesk");
Datahelper.connection();
String query="";
if(request.getParameter("btnsubmit")!=null)
{
	//query="select * from frontdesk where username='"+request.getParameter("txtsearch")+"'";
	//query="select * from frontdesk where username like '"+request.getParameter("txtsearch")+"%" +"'";
	query="select * from facultyreport where reportdate between '"+request.getParameter("txtstart") +"' and '"+request.getParameter("txtend")+"'";

}
else
{
	query="select * from frontdesk";
}
ResultSet res=Datahelper.selectData(query);


while(res.next())
{ %>
   <tr><td><%= res.getString(1)  %></td><td><%= res.getString(2)  %></td><td><%= res.getString(3)  %></td><td><%= res.getString(4)  %></td><td><a href="Editrec.jsp?q=<%= res.getString(1)  %>"><img src="edit.png" width="50" height="50" /></a></td><td><a href="Deleterec.jsp?q=<%= res.getString(1)  %>"><img src="del.jpg" width="50" height="50"/></a></td></tr>
<% }
Datahelper.closeConnection();

%>

</table>
</div>
</div>
<%@include file="footer.jsp" %>
