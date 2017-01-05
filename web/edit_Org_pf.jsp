<%-- 
    Document   : edit_Org_pf
    Created on : Feb 17, 2016, 3:31:15 PM
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
<html lang="en">
<head>
  <title>ORGANISER-REGISTRATION</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="css/animate.min.css" type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/creative.css" type="text/css">
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
<body >
    <%@include file="Org_header.jsp" %>
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
            ps=con.prepareStatement("select * from wp.organasation where email=?");
            ps.setString(1, s2);
            java.sql.ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                
           %>
<div class="container">
    <form class="form-horizontal" role="form" action="edit_org" method="post">
                <h2>ORGANISATION Registration Form</h2>
                <div class="form-group">
                    <label for="OrgName" class="col-sm-3 control-label">ORGANISATION NAME</label>
                    <div class="col-sm-9">
                        <input type="text" name="OrgName" id="OrgName"value="<%=rs.getString("OrgName")%>" placeholder="Full Name" class="form-control" autofocus>
                       
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-9">
                        <input type="email" name="email" id="email" value="<%=rs.getString("email")%>" placeholder="Email" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Password</label>
                    <div class="col-sm-9">
                        <input type="password" name="password1" id="password1" value="<%=rs.getString("password1")%>" placeholder="Password" class="form-control">
                    </div>
                </div>
               
                <div class="form-group">
                    <label for="country" id="cou"class="col-sm-3 control-label">Country</label>
                    <div class="col-sm-9">
                        <select name="cou" id="cou" class="form-control">
                            <option>--SELECT CITY--</option>
                            <option>INDIA</option>
                            <option>AUSTRALIA</option>
                            <option>PAKISTAN</option>
                            <option>USA</option>
                            <option>UK</option>
                            <option>AUSTRIA</option>
                            <option>SRI LANKA</option>
                            <option>CHAINA</option>
                        </select>
                    </div>
                </div> <!-- /.form-group -->
                 <!-- /.form-group -->
                 <div class="form-group">
                    <label for="address" class="col-sm-3 control-label">Address</label>
                    <div class="col-sm-9">
                        <input type="text" name="adress" id="adress"value="<%=rs.getString("adress")%>" placeholder="address" class="form-control">
                    </div>
                </div>
                 <div class="form-group">
        <label class="col-xs-3 control-label">Type</label>
        <div class="col-xs-9">
            <select id="type" name="type" class="form-control" name="type">
                <option value="o">organisation</option>
            </select>
        </div>
         </br>
    </div>


                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox">I accept <a href="#">terms</a>
                            </label>
                        </div>
                    </div>
                </div> <!-- /.form-group -->
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <button type="submit" class="btn btn-primary btn-block">Register</button>
                    </div>
                </div>
            </form> <!-- /form -->
        </div> <!-- ./container -->
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
