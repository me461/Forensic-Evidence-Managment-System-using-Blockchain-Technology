<%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@ page session="true" %>
<%
    String username = request.getParameter("username");
    System.out.println(username);
    String password = request.getParameter("password");
    System.out.println(password);
    try{
       
       // String user=null;
        //String password=null;
	Class.forName("com.mysql.jdbc.Driver");	
        Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/dna","root","root");
        Statement st = co.createStatement();
        ResultSet rs = st.executeQuery("select * from cloud1 where username='"+username+"' and password='"+password+"'");
       if(rs.next())
        {
         String  user = rs.getString(1);
		   session.setAttribute("user",user);
		   System.out.println("User:"+username);
			response.sendRedirect("cloud1home.jsp?msg=Login Succcess");
        }
       else 
        {
            response.sendRedirect("cloud1.jsp?m1=LoginFail");
                }
	}
    catch(Exception e)
    {
        System.out.println("Error in studentact"+e.getMessage());
    }
%>



