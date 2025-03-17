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
        ResultSet rs = st.executeQuery("select * from pathology where userid='"+username+"' and password='"+password+"'");
       if(rs.next())
        {
         String  user = rs.getString(1);
		   session.setAttribute("user",user);
		   System.out.println("User:"+username);
			response.sendRedirect("pathologyhome.jsp?msg=Login Succcess");
        }
       else 
        {
            response.sendRedirect("pathology.jsp?m1=LoginFail");
                }
	}
    catch(Exception e)
    {
        System.out.println("Error in studentact"+e.getMessage());
    }
%>



