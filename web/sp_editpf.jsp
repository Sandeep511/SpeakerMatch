<%-- 
    Document   : sp_editpf
    Created on : Feb 16, 2016, 12:33:17 PM
    Author     : Rajeev
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>-->
<html lang="en">
<head>
  <title>SPEAKER-REGISTRATION</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
 <script>
     $(function() {
    $( "#dob" ).datepicker({dateFormat: 'yy-mm-dd'});
  });</script>
 
 <script>
  function Validation() {
    // body...
    var regex = /^[A-Za-z\s]{1,}$/;
    var Regemail=/^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/;
    var mobreg=/^[0-9]+$/;
     var pass  = /^[a-zA-Z0-9!@#$%^&*]{6,16}$/;
    var password1 = document.regspeaker.password1.value;
    var password2 = document.regspeaker.password2.value;

    if(!document.regspeaker.Name.value.match(regex))
    {
      alert("please enter correct name");
      document.regspeaker.Name.focus();
      return false;
    }
      if (!document.regspeaker.email_id.value.match(Regemail)) 
     {
        alert("Not a valid e-mail address");
        document.regspeaker.email_id.focus();
        return false;
      }
     if((!document.regspeaker.password1.value.match(pass)) && (document.regspeaker.password1.value==""))
    {
      alert("please enter valid password");
      document.regspeaker.password1.focus();
      return false;
    } 
    if(document.regspeaker.country.value==-1)
    {
        alert("select valid country");
        return false;
    }
    if(password1 != password2)
    {
      alert("Both the passwords doesn't match");
      document.regspeaker.password2.focus();
      return false;
    }
     if(!document.regspeaker.mob.value.match(mobreg)|| document.regspeaker.mob.value.length!=10)
    {
      alert("please enter proper phone number");
      document.regspeaker.mob.focus();
      return false;
    } 
    return true;
}

  </script>
  
</head>

<style>
body {
    background-color: #eee;
}

*[role="form"] {
    max-width: 530px;
    padding: 15px;
    margin: 0 auto;
    background-color: #fff;
    border-radius: 0.3em;
}

*[role="form"] h2 {
    margin-left: 5em;
    margin-bottom: 1em;
}


</style>

<body>
    <%@include file="Speakerheader.jsp" %>
<center> 
    <% 
        HttpSession s=request.getSession(true);
        String s2=s.getAttribute("email_sp").toString();
        
        java.sql.Connection con=null;
        String url="jdbc:mysql://localhost:3306/wp";
        String user="root";
        String password="Sunny@511";
        PreparedStatement ps;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(url,user,password);
            out.println(s2);
            ps=con.prepareStatement("select * from wp.speaker where email_sp=?");
            ps.setString(1, s2);
            java.sql.ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
    //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wp","root","Sunny@511");
//              Statement insert;
//              insert = con.createStatement();
//              out.println(s2);
//              
//                 String sql= ("select * from wp.speaker where email_sp=?");
//                 sql.setString("email_sp");
             %>
<div class="container">
    <form class="form-horizontal" name="regspeaker" action="editpf" onsubmit="return Validation();" method="post">
                <h2>Speaker Registration Form</h2>
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">Full Name</label>
                    <div class="col-sm-9">
                        <input type="text" name="Name" id="Name" placeholdfirstNameer="Full Name" value="<%=rs.getString("Name")%>" class="form-control" autofocus>
                        <span class="help-block">Last Name, First Name, eg.: Smith, Harry</span>
                    </div>
            
                </div>
                </br>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-9">
                        <input type="email" name="email_id" id="email_id" placeholder="Email" value="<%=rs.getString("email_sp")%>" class="form-control">
                    </div>
                     </br>
                      </br>
                       </br>
                        </br>
                </div>
                </br>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Password</label>
                    <div class="col-sm-9">
                        <input type="password" name="password1" id="password1" placeholder="Password" value="<%=rs.getString("password1")%>" class="form-control">
                    </div>
                     </br>
                      </br>
                </div>
                 </br>
                <div class="form-group">
                    
                    <label for="mobile" class="col-sm-3 control-label">MOBILE</label>
                    <div class="col-sm-9">
                        <input type="mobile" name="mob"id="mob" placeholder="mobile" value="<%=rs.getString("mob") %>" class="form-control">
                         </br>
                    </div>
                      </br>
                      </br>
              <div class="form-group">
                    <label for="birthDate" class="col-sm-3 control-label">Date of Birth</label>
                    <div class="col-sm-9">
                        <input type="date" name="dob" id="dob" value="<%=rs.getString("dob") %>" class="form-control">
                    </div>
                </div>
                      </br>
                <div class="form-group">
                    <label for="country"  class="col-sm-3 control-label">Country</label>
                    <div class="col-sm-9">
                        <select id="country"name="country" value="<%=rs.getString("country") %>"class="form-control">
                            <option value="-1">--SELECT CITY--</option>
                            <option  value="HYDERABAD">HYDERABAD </option>
                            <option value="DELHI">DELHI</option>
                            <option value="MUMBAI">MUMBAI</option>
                            <option value="CULCATTA">CULCATTA</option>
                            <option value="CHENNAI">CHENNAI</option>
                            <option value="PUNE">PUNE</option>
                            <option value="BHOPAL">BHOPAL</option>
                            <option value="BANGALORE">BANGALORE</option>
                        </select>
                    </div>
                     </br>
                </div> <!-- /.form-group -->
                </br>
    <div class="form-group">
        <label class="col-xs-3 control-label">Gender</label>
        <div class="col-xs-9">
            <select id="gender" name="gender" value="<%=rs.getString("gender") %>" class="form-control" name="gender">
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>
        </div>
         </br>
    </div>
       <div class="form-group">
        <label class="col-xs-3 control-label">Type</label>
        <div class="col-xs-9">
            <select id="type" name="type" class="form-control" name="type">
                <option value="s">speaker</option>
            </select>
        </div>
         </br>
    </div>
                
                </br>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox">I accept <a href="#">terms</a>
                            </label>
                        </div>
                    </div>
                </div> <!-- /.form-group -->
                </br>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <input type="submit" class="btn btn-primary btn-block" value="Register" name="Register">
                    </div>
                </div>
            </br>
        </div>
               
            </form><!-- ./container -->
            <% }
con.close();
}
catch(Exception e)
{
out.println(e.getMessage());
}
finally{
out.close();
}
    %>
      </center>  
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
