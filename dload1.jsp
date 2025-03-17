
<%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@ page session="true" %>

<%
    String pid = request.getParameter("pid");
    System.out.println(pid);
    String ukey = request.getParameter("ukey");
    System.out.println(ukey);
    try{
       
        String user=null;
        
       
        Connection co = Dbconnection.getConnection();
        Statement st = co.createStatement();
        ResultSet rs = st.executeQuery("select * from request where pid='"+pid+"' and ustatus='"+ukey+"'");
       if(rs.next())
        {
         
			response.sendRedirect("downloadact.jsp?"+pid+"");
        }
       else 
        {
            response.sendRedirect("download.jsp?m1");
        }
	}
    catch(Exception e)
    {
        System.out.println("Error in useract"+e.getMessage());
    }
%>


