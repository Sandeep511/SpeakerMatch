<%-- 
    Document   : index
    Created on : Mar 5, 2016, 5:39:59 PM
    Author     : Sandeep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Admin Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function()
{
	$("#forgetpass").hide();
    $("#another").click(function()
    {
    	 $("#form").hide();
			        $("#forgetpass").toggle(1000);

       });
});
</script>
</head>
<style>
body {
    background-color: white;
}

#loginbox {
    margin-top: 30px;
    border-radius: 200px;
}

#loginbox > div:first-child {        
    padding-bottom: 10px;    
}

.iconmelon {
    display: block;
    margin: auto;
}

#form > div {
    margin-bottom: 25px;
}

#form > div:last-child {
    margin-top: 10px;
    margin-bottom: 10px;
}

.panel {    
    background-color: transparent;
}

.panel-body {
    padding-top: 30px;
    background-color: rgba(2555,255,255,.3);
}

#particles {
    width: 100%;
    height: 100%;
    overflow: hidden;
    top: 0;                        
    bottom: 0;
    left: 0;
    right: 0;
    position: absolute;
    z-index: -2;
}

.iconmelon,
.im {
  position: relative;
  width: 150px;
  height: 150px;
  display: block;
  fill: #525151;
}

.iconmelon:after,
.im:after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
</style>
<body>
<img src="images/unnamed.gif">
<div class="container">    
        
    <div id="loginbox" class="mainbox col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3"> 
        
        <div class="row">  

            <div class="iconmelon">
                
            </div>
        </div>
        
        <div class="panel panel-default" >
            <div class="panel-heading" style="background-color:#000066; color:white;">
                <div class="panel-title text-center">MSIT</div>
            </div>     

            <div class="panel-body" >

                <form name="form" id="form" class="form-horizontal" method="POST">
                   
                    <div class="input-group">
                        <span class="input-group-addon" style="background-color:#000066;"><i class="glyphicon glyphicon-user" ></i></span>
                        <input id="user" type="email" class="form-control" name="email" value="" placeholder="email">                                        
                    </div>

                    <div class="input-group">
                        <span class="input-group-addon" style="background-color:#000066;"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="password" type="password" class="form-control" name="password" placeholder="Password">
                    </div>                                                                  

                    <div class="form-group">
                        <!-- Button -->
                        <div class="col-sm-12 controls">
<!--                            <button type="submit" href="Adminslide.jsp" class="btn btn-primary pull-right" style="background-color:#000066;"><i class="glyphicon glyphicon-log-in"></i> Log in</button>                          -->
<a href="DASH.jsp" class="btn btn-primary">load</a>
                        </div>
                    </div>
                    <span>Forget password?</span><a id="another">Click here</a>
                </form>    

                <form name="form" id="forgetpass" class="form-horizontal" enctype="multipart/form-data" method="POST">
                <span>please enter emailId</span>
                	<div class="input-group">
                        <span class="input-group-addon" style="background-color:#000066;"><i class="glyphicon glyphicon-user" ></i></span>
                        <input id="user" type="text" class="form-control" name="email" value="" placeholder="email">                                        
                    </div>
                    <div class="form-group">
                        <!-- Button -->
                        <div class="col-sm-12 controls">
                            <button type="submit" href="#" class="btn btn-primary pull-right" style="background-color:#000066;"><i class="glyphicon glyphicon-log-in"></i> submit</button>                          
                        </div>
                    </div> 
                </form> 

            
            
        </div>  
    </div>
</div>
<div id="another2">
	
</div>

<div id="particles"></div>


</body>
</html>

