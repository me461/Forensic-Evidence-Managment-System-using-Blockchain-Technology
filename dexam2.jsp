<%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@ page session="true" %>
    <%
    String username = request.getParameter("fir");
    String password = request.getParameter("location"); 
    String email = request.getParameter("desc"); 
    String mobile = request.getParameter("bccode"); 
    String psid = request.getParameter("report");    
    // String address = request.getParameter("address");  
    
    int pk = psid.hashCode();
    
    int k = 0;
    
    try{   
        
    Connection con=Dbconnection.getConnection();
    PreparedStatement ps=con.prepareStatement("insert into doctor_report values(?,?,?,?,?)");
    //ps.setInt(1,k);
    ps.setString(1,username);
    ps.setString(2,password);
   
    ps.setString(3,email);  
    ps.setInt(4,pk);
  ps.setString(5,psid);
    
    int i=ps.executeUpdate();
    if(i>0)
    {
    response.sendRedirect("dexam.jsp?m1=Registered");
    }
    else{
    response.sendRedirect("dexam.jsp?m2=Failed");    
    }
    %>
    <%
    }

    catch(Exception e)
    {
        
       out.println(e);
          
    }
    %>