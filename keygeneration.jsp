  <%@page import="java.util.Random"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="javax.crypto.KeyGenerator"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@ page session="true" %>
<% 
    
    KeyGenerator keyGen = KeyGenerator.getInstance("AES");
                                keyGen.init(128);
                               SecretKey secretKey = keyGen.generateKey();
                                System.out.println("secret key:" + secretKey);
                              // converting secretkey to String
                                byte[] be = secretKey.getEncoded();//encoding secretkey
                               String skey = Base64.encode(be);
                                System.out.println("converted secretkey to string:" + skey);
                               // String cipher = new encryption().encrypt(str, secretKey)
    
    
    
    
    String pid=request.getParameter("pid");
     String dna1=request.getParameter("dna1");
    String dna2=request.getParameter("dna2");
       String dna3=request.getParameter("dna3");
     String dna4=request.getParameter("dna4");
      String date=request.getParameter("date");
       String h=request.getParameter("h");
     
     
     
     //Random key///
      Random r= new Random();
      int i=r.nextInt(10000 - 5000) + 5000;
      String publickey = i+"";
      
      Random r1= new Random();
      int i1=r1.nextInt(10000 - 5000) + 5000;
      String privatekey = i1+"";
      
      try{
           Connection con = Dbconnection.getConnection();
                            Statement st = con.createStatement();
       
                            int j = st.executeUpdate("insert into keygen(pid,dna1,dna2,dna3,dna4,date,skey,privatekey,hospital)values('"+pid+"','"+dna1+"','"+dna2+"','"+dna3+"','"+dna4+"','"+date+"','"+publickey+"','"+skey+"','"+h+"')");
    
      if (j !=0){
        
          response.sendRedirect("viewresaerchfiles.jsp?msg=success");
      }
      else{
          response.sendRedirect("viewresaerchfiles.jsp?gg=Failed");
      }
    
} catch (Exception ex) {
    response.sendRedirect("viewresaerchfiles.jsp?g=Failed");                       }

    
 
            
                                %>
    