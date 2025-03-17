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
    
     <script>
    function validateform(){  
var username=document.myform.username.value;  
var password=document.myform.password.value;
var phoneno = document.getElementById('txtphoneno');
 
  
if (document.myform.username.value == "") {
        alert("Enter a username");
        document.myform.username.focus();
        return false;
    }
    if (!/^[a-zA-Z]*$/g.test(document.myform.username.value)) {
        alert("Please use only characters for username");
        
        document.myform.username.focus();
        return false;
    }
else if(password.length<6){  
  alert("Password must be at least 6 characters long.");  
  return false;  
  }
  if (phoneno.value == "" || phoneno.value == null) {
            alert("Please enter your Mobile No.");
            return false;
        }
        if (phoneno.value.length < 10 || phoneno.value.length > 10) {
            alert("Mobile No. is not valid, Please Enter 10 Digit Mobile No.");
            return false;
        }

    }
    </script>
      
  <%
if(request.getParameter("msggg")!=null){%>
    
    <script>alert('Duplicate entry for email..!')</script>


<%}
if(request.getParameter("msgg")!=null){%>

<script>alert('Registration Failed..!')</script>
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
            <li><a href="index.html">Home</a></li>
                                    <li><a href="hospital1.jsp">Hospital1</a></li>
                                    <li><a href="hospital2.jsp">Hospital2</a></li>
                                    <li><a href="cloud1.jsp">Cloud1</a></li>
                                    <li><a href="cloud2.jsp">Cloud2</a></li> 
                                    <li><a href="researcher.jsp" class="selected">Researcher</a></li>  
                                     <li><a href="user.jsp">User</a></li>  
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
            <h2><font color="white">Researcher Registration</font></h2>
            		<form name="myform" id="loginForm" action="researcherregact.jsp" method="post"   onsubmit="return validateform()" >
                            <table>		
					
                                <tr><th>Name</th><th><input class="form-control" type="text" id="subscribe-email" name="username" placeholder="Name" required></input></th></tr><tr></tr><tr></tr>
            <tr><th>Email:</th><th><input class="form-control" type="email" id="subscribe-email" name="email" placeholder="Email Address"  required></input></th></tr><tr></tr><tr></tr>
            <tr><th>Password:</th><th><input class="form-control" type="password" id="subscribe-email" name="password" placeholder="Password"  required></input></th></tr><tr></tr><tr></tr>
            <tr><th>DOB:</th><th><input class="form-control" type="date" id="subscribe-email" name="date"  required></input></th></tr><tr></tr><tr></tr>
            <tr><th>ContactNO:</th><th><input class="form-control" type="text" name="phoneno" id="txtphoneno" placeholder="Contactno" onkeypress="return isNumber(event)" required></input></th></tr><tr></tr><tr></tr>
                                       
                                        
                  </table>
                                     
                                              <center>   <input type="submit" value="Register"  style=" border-radius: 8px; height: 45px;width: 115px; color:white;background-color:black " class=""  />
                            <input type="reset" value="Reset"  style=" border-radius: 8px; height: 45px;width: 115px; color:white;background-color:black " class="" /><br />
                       
                        </center>
                     
                                                  </div>
                                </form> </center> 
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