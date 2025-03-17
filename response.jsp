<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@page import="Dna.Sources.Mail"%>

<%   
String pid = request.getParameter("pid");

String email = request.getParameter("email");

String privatekey = null;



try{
    int j =0;
     Connection con = Dbconnection.getConnection();
                            Statement st = con.createStatement();
                            ResultSet rs = null;
                            ResultSet rs1 = null;
       rs = st.executeQuery("select email from request where email='"+email+"' and pid='"+pid+"'");
                           
       while( rs.next())
       {
       rs.getString("email");
       // System.out.println("owner name is   "  + rs.getString("pid")  ); 
        rs1 =st.executeQuery("select privatekey from encfile where pid='"+pid+"'");
        if(rs1.next() )
        {
         privatekey =rs1.getString("privatekey");
         System.out.println("key is   "  + rs1.getString("privatekey")  );
          j = st.executeUpdate("update request set status= 'yes', privatekey='"+rs1.getString("privatekey")+"' where pid='"+pid+"'and email='"+email+"'");
          if (j !=0){
         
              Mail m = new Mail();
          String msg ="Patient ID:"+pid+"\ndecryption key :"+privatekey;     
          m.secretMail(msg,pid,email);
          response.sendRedirect("researchreq.jsp?m1=success");
          
        }
          else{
          response.sendRedirect("researchreq.jsp?m2=Failed");
      }
           }
      
       }
       
       
       
    
      
     
    
} catch (Exception ex) {
  ex.printStackTrace();
   }
   %>
