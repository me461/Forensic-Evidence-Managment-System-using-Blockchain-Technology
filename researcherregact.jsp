
          
               
  <%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@ page session="true" %>
<%
    Connection con = null;
    Statement st = null;
   ResultSet rs = null;
    
     String id = request.getParameter("id");
    String a = request.getParameter("username");
     
        String b = request.getParameter("email");
          String c = request.getParameter("password");
         String d = request.getParameter("date");
          String e = request.getParameter("phoneno");
          String status = "NO";
          String g = request.getParameter("dkey");
         // String h = request.getParameter("otp");
    try
    {
        
   

        Connection co = Dbconnection.getConnection();

PreparedStatement ps = co.prepareStatement("insert into researcher values(?,?,?,?,?,?,?,?)");

ps.setString(1,id);
ps.setString(2,a);
ps.setString(3,b);
ps.setString(4,c);
ps.setString(5,d);
ps.setString(6,e);
ps.setString(7,status);
ps.setString(8,g);
//ps.setString(9,h);



ps.executeUpdate();

//out.print(Successfully Registered);

response.sendRedirect("researcher.jsp?message=success");
out.println("Registered Successfully");
}
catch(Exception e1)
{
 response.sendRedirect("researcherreg.jsp?msggg=duplicate entry");
}


%>

    
    
   
</div>
</body>
</html>
