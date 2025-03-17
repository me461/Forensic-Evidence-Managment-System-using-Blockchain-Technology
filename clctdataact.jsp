<%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@ page session="true" %>
    <%
    String username = request.getParameter("fir");
   String password = request.getParameter("ci"); 
   System.out.println(username);
    int p = 0;
    
    p = username.hashCode();
    
    int k = 0;
    
    try{   
        
    Connection con=Dbconnection.getConnection();
    PreparedStatement ps=con.prepareStatement("insert into crime values(?,?,?)");
    
    ps.setString(1,username);
    ps.setString(2,password);
    ps.setInt(3,p);
   

    
    int i=ps.executeUpdate();
    if(i>0)
    {
    response.sendRedirect("clctdata.jsp?m1=Registered");
    }
    else{
    response.sendRedirect("clctdata.jsp?m2=Failed");    
    }
    %>
    <%
    }

    catch(Exception e)
    {
        
       out.println(e);
          
    }
    %>