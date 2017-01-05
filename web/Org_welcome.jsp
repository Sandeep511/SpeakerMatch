<%-- 
    Document   : Org_welcome
    Created on : Feb 17, 2016, 1:32:18 PM
    Author     : Sandeep
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

  

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Organisation-Welcome Page</title>
    <script>
            var request;
            function sendInfo()
            {
               
                var v = document.myForm.name.value;
//                var v1=document.Login_Form.pwd.value;
                var url = "getspeaker.jsp?val=" + v;

                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    request.onreadystatechange = getInfo;
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                }
            }

            function getInfo() {
//                 alert("hello");
                if (request.readyState == 4) {
                    var val = request.responseText;
                   // var val=request.responseText;
                 //  alert(val);                        // alert("Unable to connect to server");

                    document.getElementById("span1").innerHTML = val;
                    // document.getElementById('email').innerHTML = val;
                }
            }

        </script>
        <script>
            var request;
            function sendEmail()
            {
//               alert("dates");
                var v = document.myForm.span1.value;
//                var v1=document.Login_Form.pwd.value;
                var url = "getsdates.jsp?val=" + v;

                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    request.onreadystatechange = getDate;
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                }
            }

            function getDate() {
//                 alert("hello");
                if (request.readyState == 4) {
                    var val = request.responseText;
                   // var val=request.responseText;
//                  alert(val);                        // alert("Unable to connect to server");

                    document.getElementById("d1").innerHTML = val;
                    // document.getElementById('email').innerHTML = val;
                }
            }

        </script>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

        
    <!-- Navigation -->
    <%@include file="Org_header.jsp" %>
    

    <!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('http://www.new-atlantic.net/wp-content/uploads/2014/01/1900x1080-315.jpg');"></div>
                <div class="carousel-caption">
                    <h2>  Organisation</h2>
                </div>
            </div>
           
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>

    <!-- Page Content -->
    <div class="container">

        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Welcome to Organiser
                </h1>
                
            </div>
           
        </div>
        <form name="myForm" action="req_sp" method="post">
        <span>topics:</span>
        <select name="name" onchange="sendInfo()">
        <%
            java.sql.Connection con=null;
    String url="jdbc:mysql://localhost:3306/wp";
    String user="root";
    String password="Sunny@511";
    PreparedStatement ps,ps2; 
    try{  
Class.forName("com.mysql.jdbc.Driver");  
  
             con=DriverManager.getConnection(url,user,password);  
              //String s2=session.getAttribute("email_id").toString();
              //out.println(s2);
ps=con.prepareStatement("select * from topics");
//ps.executeUpdate();
            java.sql.ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
        %>
        
            <option  class="btn btn-success btn-lg"  value="<%out.println(rs.getString("topic_name"));%>"><%out.println(rs.getString("topic_name"));%></option>
        
            <%}        
con.close();

  
        }
        
       catch(Exception e){ 
       out.println(e.getMessage());
       }


                %>
 
              
             </select>
              </div>
         
<div class="form-group">
            <label class="col-lg-3 control-label">speaker Id:</label>
            <div class="col-lg-8">
              <div class="ui-select">
                  <select id="span1" class="form-control" name="span1" onchange="sendEmail()">
                      </select>
              </div>
            </div>
          </div>
<div class="form-group">
            <label class="col-lg-3 control-label">available dates:</label>
            <div class="col-lg-8">
              <div class="ui-select">
                  <select id="d1" class="form-control" name="d1" >
                      </select>
              </div>
            </div>
          </div>
            <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="submit" class="btn btn-primary" value="Send request">
              <span></span>
              <input type="reset" class="btn btn-default" value="Cancel">
            </div>
          </div>
<!--
                <span>available dates:</span>   <select id="d1" name="s_date"></select>-->

                </form> 

                
                
        
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Sandeep....</p>
                </div>
            </div>
        </footer>
                <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/jquery.fittext.js"></script>
    <script src="js/wow.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/creative.js"></script>

   
    <!-- /.container -->

    <!-- jQuery -->

</body>

</html>

