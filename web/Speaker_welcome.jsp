<%-- 
    Document   : Speaker_welcome
    Created on : Feb 15, 2016, 11:31:45 AM
    Author     : Sandeep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    </head>
    <body>
         <%@include file="Speakerheader.jsp" %>
        <%HttpSession s=request.getSession(true);
        String s2=s.getAttribute("email_sp").toString();
        %>
   
        <!--<h1>Hello World!</h1>
        <%out.println(s2);%>-->
        <div class="container">
  <div class="row">
  	<div class="col-md-6">
    
          <form class="form-horizontal" action="sp_pro" method="POST">
             <!-- <a href="../Updateservlets/sp_pro.java"></a>-->
          <fieldset>
            <div id="legend">
              <legend class="">Register</legend>
            </div>
           
         
            <div class="control-group">
              <label class="control-label" for="email">E-mail</label>
              <div class="controls">
                  <input type="email" id="email_sp" name="email_sp" placeholder="email" value="<%=s2%>" class="form-control input-lg">
                <p class="help-block">Please provide your E-mail</p>
                
              </div>
            </div>
         
           
         
            <div class="control-group">
              <label class="control-label" for="Topic_name">Topic_Name</label>
              <div class="controls">
                <input type="text" id="topic" name="topic" placeholder="topic_name" class="form-control input-lg">
                <p class="help-block">Please confirm topic_name</p>
              </div>
            </div>
               <div class="control-group">
              <label class="control-label" for="Experience">Experience</label>
              <div class="controls">
                <input type="text" id="exp" name="exp" placeholder="Experience" class="form-control input-lg">
                <p class="help-block">Please confirm Experienece</p>
              </div>
            </div>
               <div class="control-group">
              <label class="control-label" for="Conferrence_attended">Conference Attended</label>
              <div class="controls">
                <input type="text" id="conf_att" name="conf_att" placeholder="conf_att" class="form-control input-lg">
                <p class="help-block">Please confirm conferrece attended</p>
              </div>
            </div>
                 <div class="control-group">
              <label class="control-label" for="Description">Description</label>
              <div class="controls">
                <input type="text" id="descrption" name="description" placeholder="Description" class="form-control input-lg">
                <p class="help-block">Please confirm descrption</p>
              </div>
            </div>
         
            <div class="control-group">
              <!-- Button -->
              <div class="controls">
                <button class="btn btn-success">Update</button>
              </div>
            </div>
                
          </fieldset>
        </form>
    
    </div> 
  </div>
</div>
                <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/jquery.fittext.js"></script>
    <script src="js/wow.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/creative.js"></script>

    </body>
</html>
