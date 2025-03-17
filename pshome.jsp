<!-- templatemo 383 smoke house -->
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

}
</script>

</head>
      <%
if(request.getParameter("msg")!=null){%>
    
    <script>alert('Login Sucessfully..!')</script>

<%}
if(request.getParameter("m1")!=null){%>

 <script>alert('Login Failed..!')</script>
 <%
}
%>
<%
if(request.getParameter("message")!=null){%>
    
    <script>alert('File Uploaded into Cloud Sucessfully..!')</script>

<%}
if(request.getParameter("g")!=null){%>

 <script>alert('File Uploaded into Cloud Sucessfully..!')</script>
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
            <li><a href="pshome.jsp" class="selected">Home</a></li>
                                     <li><a href="addfir.jsp">Add FIR</a></li>
                                    <li><a href="clctdata.jsp">Collect Crime Data</a></li>                                    
                                    <li><a href="managein.jsp">Manage Investigation</a></li>                                     
                                    <li><a href="logout.jsp">logout</a></li>  
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
        	<h2>Welcome Police Station </h2>
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