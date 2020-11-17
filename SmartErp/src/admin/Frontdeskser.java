package admin;

import java.io.IOException;
import DAL.Datahelper;
import bean.Frontdesk;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Frontdeskser
 */
@WebServlet("/Frontdeskser")
public class Frontdeskser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Frontdeskser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			String uname = request.getParameter("txtuname");
			String upass = request.getParameter("txtupass");
			String umobile = request.getParameter("txtumobile");
			String fname = request.getParameter("txtfname");
			Frontdesk obj = new Frontdesk();
			obj.setUname(uname);
			obj.setUpass(upass);
			obj.setUmobile(umobile);
			obj.setFname(fname);
			//Class.forName("com.mysql.jdbc.Driver");
			//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smarterp","root","");
			//Statement st = con.createStatement();
			Datahelper.connection();
			int res=Datahelper.insertUpdateDelete("insert into frontdesk(username,password,mobileno,fullname) values('"+obj.getUname()+"','"+obj.getUpass()+"','"+obj.getUmobile()+"','"+obj.getFname()+"')");
			
			
			String s = "";
			if(res!=0)
			{
				s = "Data inserted successfully";
			}
			else
			{
				s = "Data not inseretd successfully";
			}
			Datahelper.closeConnection();
			response.sendRedirect("admin/addfrontdesk.jsp?q="+s);
			
			
			
		}
		
		catch(Exception ex)
		{
			
		}
	}

}
