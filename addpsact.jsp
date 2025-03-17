<%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@ page session="true" %>
    <%
    String username = request.getParameter("username");
    String password = request.getParameter("password"); 
    String email = request.getParameter("email"); 
    String mobile = request.getParameter("mobile"); 
    String psid = request.getParameter("psid");    
     String address = request.getParameter("address");  
    
    int k = 0;
    
    try{   
        
    Connection con=Dbconnection.getConnection();
    PreparedStatement ps=con.prepareStatement("insert into police values(?,?,?,?,?,?,?)");
    ps.setInt(1,k);
    ps.setString(2,username);
    ps.setString(3,password);
    ps.setString(4,psid);
    ps.setString(5,email);  
    ps.setString(6,mobile);
    ps.setString(7,address);
    
    int i=ps.executeUpdate();
    if(i>0)
    {
    response.sendRedirect("fupload.jsp?m1=Registered");
    }
    else{
    response.sendRedirect("fupload.jsp?m2=Failed");    
    }
    %>
    <%
    }

    catch(Exception e)
    {
        
       out.println(e);
          
    }
    %>