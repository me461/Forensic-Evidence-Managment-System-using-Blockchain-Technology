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
    PreparedStatement ps=con.prepareStatement("insert into doctor values(?,?,?,?,?,?)");
    ps.setInt(1,k);
    ps.setString(2,username);
    ps.setString(3,password);
   
    ps.setString(4,email);  
    ps.setString(5,mobile);
    ps.setString(6,address);
    
    int i=ps.executeUpdate();
    if(i>0)
    {
    response.sendRedirect("adddoc.jsp?m1=Registered");
    }
    else{
    response.sendRedirect("adddoc.jsp?m2=Failed");    
    }
    %>
    <%
    }

    catch(Exception e)
    {
        
       out.println(e);
          
    }
    %>