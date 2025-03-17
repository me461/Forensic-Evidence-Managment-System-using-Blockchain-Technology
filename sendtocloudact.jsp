  <%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@ page session="true" %>
<%

    String pid = request.getParameter("pid");
    
     String dna1 = request.getParameter("dna1");
      String dna2 = request.getParameter("dna2");
       String dna3 = request.getParameter("dna3");
        String dna4 = request.getParameter("dna4");
     
    String date = request.getParameter("date");
   // String data = request.getParameter("data");
 
  //  String owner = request.getParameter("owner");
    //String size = request.getParameter("size");
    //System.err.println(fname + mail + size);
    try {
        Connection con;
        Statement st;
        con = Dbconnection.getConnection();
        st = con.createStatement();
        int j = st.executeUpdate("insert into sendfiles(pid,dna1,dna2,dna3,dna4,date,hospital) values('" + pid + "','" + dna1 + "','" + dna2 + "','" + dna3 + "','" + dna4 + "','" + date + "','hospital1')");
        if (j != 0) {

            response.sendRedirect("sendtocloud.jsp?msg=Request_sent_to_Cloud2");
        } else {
            response.sendRedirect("sendtocloud.jsp?msgg=Request_failed");
        }



    } catch (Exception ex) {
        response.sendRedirect("sendtocloud.jsp?m2=You_hava_already_given_request");
        ex.printStackTrace();
    }
%>