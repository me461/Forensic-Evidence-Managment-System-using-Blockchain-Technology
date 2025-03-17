<%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@ page session="true" %>
    <%
    String username = request.getParameter("fir");
   String password = request.getParameter("location"); 
    String email = request.getParameter("desc"); 
    String p = session.getAttribute("psid").toString();
    
    
    int k = 0; int o = 0; 
    
    o = username.hashCode();
    
    
    
    try{   
        
    Connection con=Dbconnection.getConnection();
    PreparedStatement ps=con.prepareStatement("insert into fir values(?,?,?,?,?)");
    
    ps.setString(1,username);
    ps.setString(2,password);
   
    ps.setString(3,email);  
    ps.setInt(4,o);
    ps.setString(5,p);        
    
    
    int i=ps.executeUpdate();
    if(i>0)
    {
    response.sendRedirect("addfir.jsp?m1=Registered");
    }
    else{
    response.sendRedirect("addfir.jsp?m2=Failed");    
    }
    %>
    <%
    }

    catch(Exception e)
    {
        
       out.println(e);
          
    }
    %>