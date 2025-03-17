          
  <%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@ page session="true" %>
<%
   
    
        String id = request.getParameter("id");
        String a = request.getParameter("pid");
        String b = request.getParameter("dna1");
        String c = request.getParameter("dna2");
        String d = request.getParameter("dna3");
        String e = request.getParameter("dna4");         
        String f = request.getParameter("date");
   
       
       
       try{
           
   Connection co = Dbconnection.getConnection();
    Statement st = co.createStatement();
   
   ResultSet rs = st.executeQuery("select * from hfiles where pid='"+a+"' ");
       if(rs.next())
        {
         
        response.sendRedirect("hospital1home.jsp?m4=Failed");    
            
            
        }
       else{
    PreparedStatement ps = co.prepareStatement("insert into hfiles values(?,?,?,?,?,?,?,?)");
    ps.setString(1,id);
    ps.setString(2,a);    
    ps.setString(3,b);    
    ps.setString(4,c);
    ps.setString(5,d);
    ps.setString(6,e);
    ps.setString(7,f);
    ps.setString(8,"hospital1");
      
    ps.executeUpdate();
    
    PreparedStatement pst = co.prepareStatement("insert into user values(?,?)");
pst.setString(1,a);
  pst.setString(2,c);  
   pst.executeUpdate();

//out.print(Successfully Registered);

response.sendRedirect("hospital1home.jsp?message=success");
out.println("File Uploaded Successfully");
}
       }  
catch(Exception e1)
{
    //response.sendRedirect("fupload.jsp?msg=Duplicate entry for email");
out.println(e1.getMessage());
}


%>