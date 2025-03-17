<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@page import="Dna.Sources.Mail"%>
<%@page import="java.util.Random"%>
<%   
String pid = request.getParameter("pid");

String email = request.getParameter("email");

String privatekey = null;

Random r = new Random();
    int jj = r.nextInt(10000 - 5000) + 5000;
    String skey = jj+"";


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
          j = st.executeUpdate("update request set ustatus= '"+jj+"', privatekey='"+rs1.getString("privatekey")+"' where pid='"+pid+"'and email='"+email+"'");
          if (j !=0){
         
              Mail m = new Mail();
          String msg ="Patient ID:"+pid+"\nUser key :"+jj;     
          m.secretMail(msg,pid,email);
          response.sendRedirect("userhome.jsp?m1=success");
          
        }
          else{
          response.sendRedirect("aahome.jsp?msgg=Failed");
      }
           }
      
       }
       
       
       
    
      
     
    
} catch (Exception ex) {
  ex.printStackTrace();
   }
   %>
