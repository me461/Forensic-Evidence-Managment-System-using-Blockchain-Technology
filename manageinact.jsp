<%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@ page session="true" %>
    <%
    String user = request.getParameter("fir");
   String password = request.getParameter("ci"); 
   
    //System.out.println(username);
    int p = 0;
    
    p = user.hashCode();
    
    int k = 0;
    
    try{   
        
    Connection con=Dbconnection.getConnection();
    PreparedStatement ps=con.prepareStatement("insert into crime_invesigation values(?,?,?)");
    
    ps.setString(1,user);
    ps.setString(2,password);
    ps.setInt(3,p);
   

    
    int i=ps.executeUpdate();
    if(i>0)
    {
    response.sendRedirect("managein.jsp?m1=Registered");
    }
    else{
    response.sendRedirect("managein.jsp?m2=Failed");    
    }
    %>
    <%
    }

    catch(Exception e)
    {
        
       out.println(e);
          
    }
    %>