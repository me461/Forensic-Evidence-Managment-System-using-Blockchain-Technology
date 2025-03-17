
  <%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@ page session="true" %>
<center><p></p></center>
                    <center> 
                        <% 
                             //String username=session.getAttribute("username").toString();
                      String email=session.getAttribute("email").toString();
                    String  pid=request.getParameter("pid");
                   String  dna1=request.getParameter("dna1");
                   String  dna2=request.getParameter("dna2");
                   
                   
                  
                     String  dna3=request.getParameter("dna3");
                     
                  String dna4 = request.getParameter("dna4");
                    String date = request.getParameter("date");
               
                            
        try {
        Connection con;
        Statement st;
        con = Dbconnection.getConnection();
        st = con.createStatement();
        int j = st.executeUpdate("insert into request(pid, dna1, dna2, dna3, dna4, date, status,privatekey,email) values ('"+pid+"','"+dna1+"','"+dna2+"','"+dna3+"','"+dna4+"','"+date+"','No','No','"+email+"')");
        if (j != 0) {

            response.sendRedirect("reviewfiles.jsp?m=Request_sent_to_Cloud1");
        } else {
            response.sendRedirect("reviewfiles.jsp?msgg=Request_failed");
        }



    } catch (Exception ex) {
        response.sendRedirect("reviewfiles.jsp?c=You_hava_already_given_request");
        ex.printStackTrace();
    }
%>