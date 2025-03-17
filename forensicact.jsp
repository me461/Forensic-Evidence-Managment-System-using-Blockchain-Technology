<%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@ page session="true" %>
<%
    String username = request.getParameter("username");
    System.out.println(username);
    String password = request.getParameter("password");
    System.out.println(password);
    try{
       
       // String user=null;
        //String password=null;
	Connection co = Dbconnection.getConnection();
        Statement st = co.createStatement();
        ResultSet rs = st.executeQuery("select * from forensic where labname='"+username+"' and password='"+password+"'");
       if(rs.next())
        {
       String  user = rs.getString(1);
		   session.setAttribute("username",user);
		   System.out.println("User:"+user);
			response.sendRedirect("forensichome.jsp?msg=LoginSucccess");
        }
       else 
        {
            response.sendRedirect("cloud1.jsp?m1=LoginFail");
                }
	}
    catch(Exception e)
    {
        System.out.println("Error in studentact"+e.getMessage());
    }
%>



