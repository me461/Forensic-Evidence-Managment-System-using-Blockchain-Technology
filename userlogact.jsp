
<%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@ page session="true" %>

<%
    String id = request.getParameter("id");
    System.out.println(id);
    String password = request.getParameter("password");
    System.out.println(password);
    try{
       
        String user=null;
        
        //String password=null;
	  Connection con = Dbconnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from user where id='"+id+"' and password='"+password+"'");
       if(rs.next())
        {
         user = rs.getString(1);
		   session.setAttribute("user",id);
		   System.out.println("User:"+user);
			response.sendRedirect("userhome.jsp?mg=Login Success");
        }
       else 
        {
            response.sendRedirect("user.jsp?m1=LoginFail");
                }
	}
    catch(Exception e)
    {
        System.out.println("Error in useract"+e.getMessage());
    }
%>


