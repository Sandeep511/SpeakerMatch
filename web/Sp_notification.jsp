<%-- 
    Document   : Sp_notification
    Created on : Feb 18, 2016, 2:46:15 PM
    Author     : Sandeep
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    <body>
        <%@include file="Speakerheader.jsp" %> 
        </br>
        </br>
        </br>
        
        </br>
        </br>
        </br>
        </br>
        <p>v</p>
                   
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
             
            ps=con.prepareStatement("select * from req_sp where email_sp=?");
             ps.setString(1,s2);

//ps.executeUpdate();
            java.sql.ResultSet rs=ps.executeQuery();
           // String str="";
         
           int i=0;
            while(rs.next())
            {
            i++;
             %>
             <form action="accept_sp" method="POST">
             <%out.println(i);%>    <b>Organization id</b><input type="text" name="Org_name" value="<%out.println(rs.getString("Org_name"));%>" readonly>
             <b>topic</b> <input type="text" name="topic" value="<%out.println(rs.getString("topic"));%>" readonly>
             <b>date</b> <input type="text" name="date" value="<%out.println(rs.getString("date"));%>" readonly>
             <input type="submit" value="accept">
             <input type="reset" value="ignore">
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
