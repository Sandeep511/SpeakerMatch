<%-- 
    Document   : Org_notification
    Created on : Feb 18, 2016, 4:54:17 PM
    Author     : Rajeev
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet"/>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="css/animate.min.css" type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/creative.css" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="Org_header.jsp" %>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        <%
             //out.println("asdfghjkl");
             java.sql.Connection con=null;
    String url="jdbc:mysql://localhost:3306/wp";
    String user="root";
    String password="Sunny@511";
    PreparedStatement ps; 
 try{  
 Class.forName("com.mysql.jdbc.Driver");  
            HttpSession s=request.getSession(true);
              String s2=session.getAttribute("email_sp").toString();
             con=DriverManager.getConnection(url,user,password);  
//              HttpSession s=request.getSession(true);
//              String s2=session.getAttribute("email_id").toString();
              //out.println(s2);
//             out.println("<form name=\"new\" action=\"\"");
//             out.println("<select name=\"email\">");
             
            ps=con.prepareStatement("select * from accept_sp where Org_name=?");
             ps.setString(1,s2);
            java.sql.ResultSet rs=ps.executeQuery();
            
           
           int i=0;
            while(rs.next())
            {
            i++;
             %>
             <form>
             <%out.println(i);%>    <b>Speaker id</b><input type="text" name="email_sp" value="<%out.println(rs.getString("email_sp"));%>" readonly>
              <b>Organisation id</b><input type="text" name="Org_name" value="<%out.println(rs.getString("Org_name"));%>" readonly>
             <b>topic</b> <input type="text" name="topic" value="<%out.println(rs.getString("topic"));%>" readonly>
             <b>date</b> <input type="text" name="date" value="<%out.println(rs.getString("date"));%>" readonly>
             
                 
             <b>Status</b><input type="text" name="status" value="<%out.println(rs.getString("status"));%>" readonly>
             </br>
             
             <div class="col-md-8 col-md-offset-2">
                 </br>
             <a class="btn btn-success" href="Create_event.jsp"> Create Event</a>&nbsp;&nbsp;&nbsp;
              <a class="btn btn-danger" href="#">Ignore</a>
             </div>
             </form>
                     <%
                
            }
//            out.println("</select");
           
            con.close();
}
        
       catch(Exception e){ 
       out.println(e.getMessage());
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
