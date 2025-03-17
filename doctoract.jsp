
<%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@ page session="true" %>

<%
    String username = request.getParameter("username");
    System.out.println(username);
    String password = request.getParameter("password");
    System.out.println(password);
    try{
       
        String email=null;
        
        //String password=null;
	
        Connection co = Dbconnection.getConnection();
        Statement st = co.createStatement();
        ResultSet rs = st.executeQuery("select * from doctor where username='"+username+"' and password='"+password+"' ");
       if(rs.next())
        {
         email = rs.getString("email");
		   session.setAttribute("username",username);
                    session.setAttribute("email",email);
		  
			response.sendRedirect("doctorhome.jsp?mg=Login Success");
        }
       else 
        {
            response.sendRedirect("doctor.jsp?m1=LoginFail");
                }
	}
    catch(Exception e)
    {
        System.out.println("Error in useract"+e.getMessage());
    }
%>


