             
  <%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*"%>
<%@page import="Dna.Sources.Dbconnection"%>
<%@ page session="true" %><!-- templatemo 383 smoke house -->
<!-- 
Smoke House Template 
http://www.templatemo.com/preview/templatemo_383_smoke_house 
-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Forensic</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">

/***********************************************
* Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>

<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "templatemo_menu", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script> 

<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />

<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;


</script>

</head>
     <%
if(request.getParameter("msg")!=null){%>
    
    <script>alert('Privatekey Sucessfully Generated...!')</script>


<%}
if(request.getParameter("g")!=null){%>

<script>alert('Privatekey Already Generated..!')</script>
 <%
}
%>
      <%
if(request.getParameter("m")!=null){%>
    
    <script>alert('Request Sent to Cloud1...!')</script>
 

<%}
if(request.getParameter("c")!=null){%>

<script>alert('Request Already Sent..!')</script>
 <%
}
%>

<body>

<div id="templatemo_wrapper">
	<div id="templatemo_header">
    	<div id="site_title">
            <font size="5" color="white">Forensic Evidence Management System using Block Chain Technology</font>
        </div>
        <div id="header_right">
        	<form action="#" method="get">
        
                

                
            </form>
            
		</div>
        <div class="cleaner"></div>
    </div> <!-- end of templatemo_header -->
    
    <div id="templatemo_menu" class="ddsmoothmenu">
        <ul>
            <li><a href="userhome.jsp">Home</a></li>
        <li><a href="dnadata.jsp">DNA Data</a></li>     
                                    <li><a href="rerequest.jsp"class="selected">Researcher Request</a></li>                                   
                                    <li><a href="logout.jsp">Logout</a></li>
        </ul>
        <br style="clear: left" />
    </div> <!-- end of templatemo_menu -->
    
    <div id="templatemo_slider">
    	<div id="one" class="contentslider">
            <div class="cs_wrapper">
                <div class="cs_slider">
                
                <div class="cs_article">
                    <div class="slider_image_wrapper"><span></span>
                    	<img src="images/slider/1.jpg" alt="slider image 1" />
                    </div>                    
                    <div class="cs_article_des">
                        <h2>Forensic Evidence Management</h2>
                         <p>
Forensic Evidence Management System using Block Chain Technology  Provides effective method
for securing data by while giving access to researchers and save cloud space by checking Deduplicatoin before uploding
to cloud.</p>
                    </div>                           
                </div><!-- End cs_article -->
                
                <!-- End cs_article -->
                  
                  <!-- End cs_article -->
                  
                  <!-- End cs_article -->
                    
                    
              
                </div><!-- End cs_slider -->
            </div><!-- End cs_wrapper -->
        </div><!-- End contentslider -->
        
        <!-- Site JavaScript -->
        
        <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="js/jquery.ennui.contentslider.js"></script>
        <script type="text/javascript">
            $(function() {
            $('#one').ContentSlider({
            width : '800px',
            height : '260px',
            speed : 400,
            easing : 'easeOutSine'
            });
            });
        </script>
        <script src="js/jquery.chili-2.2.js" type="text/javascript"></script>
        <script src="js/chili/recipes.js" type="text/javascript"></script>
        <div class="cleaner"></div>
    </div> <!-- end of templatemo_slider -->
    
    <div id="templatemo_main">
        <center>
            <h2><font color="white">Researcher Request</font></h2>
            <% 

String id = session.getAttribute("user").toString();
try{ 
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dna","root","root");
        System.out.println("2");
	PreparedStatement pst=con.prepareStatement("select * from request where pid = '"+id+"'");
       
        
	ResultSet rs=pst.executeQuery();
        %>
        
        <center> <table style="width:40%" border="2">
         
             
  <tr>
    
     
    
     
     <th><font color="red"> Pid</th>
  <th><font color="red"> Dna1</th>
     <th><font color="red"> Dna2</th>
     <th><font color="red"> Dna3</th>
    
     <th><font color="red"> User</th>
     <th><font color="red"> Send </th>
     
</tr>

<%
       
    while(rs.next()){
            %><tr><th><center><%=rs.getString(1)%></th>
                <th><center><%=rs.getString(2)%></th>
                <th><center><%=rs.getString(3)%></th>
                <th><center><%=rs.getString(4)%></th>
        
                <th><center><%=rs.getString(9)%></th>
                <th><center><a href="uresponse.jsp?pid=<%=rs.getString("pid")%>&email=<%=rs.getString("email")%>">  Send</a> </th>
          
        </tr>
        
      <%  }

}
	catch(Exception e)
	{
		System.out.println(e);
	}
	%>
        </table>
            		  </center> 
          <div class="cleaner"></div>
         <!-- end of content -->
        
         <!-- end of templatemo_sidebar -->
        <div class="cleaner"></div>
    </div> <!-- end of templatemo_main -->
    
    
    
    <div id="templatemo_footer">
       Forensic Evidence Management
    </div> <!-- end of templatemo_footer -->
</div> <!-- end of templatemo_wrapper -->

</body>
</html>