<%-- 
    Document   : User_pass_change
    Created on : Feb 17, 2016, 2:53:05 PM
    Author     : Sandeep
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
    <%@include file="User_welcome.jsp" %>
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
            ps=con.prepareStatement("select * from wp.login where email=?");
            ps.setString(1, s2);
            java.sql.ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                
            %>
    
    <form role="passwordChange" action="passwordChnage" method="post">
<div class="container">
  <!-- Trigger the modal with a button -->
  </br>
  </br>
  </br>
  </br>
  </br>
  </br>
  </br>
  </br>
  </br>
  
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">DO YOU WANT TO CHANGE YOUR PASSWORD</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Password Changer</h4>
        </div>
        <div class="modal-body">
          <p>Change your password</p>
        </div>
          <div>
            <input type="email" class="form-control" name="email_id" value="<%=rs.getString("email")%>" placeholder="email" required=""/>
        </div>
        <div>
            <input type="text" class="form-control" name="Pasword1" value="<%=rs.getString("pasword1")%>" placeholder="Password" required=""/>
        </div>
        <div>
        <input type="text" class="form-control" name="Password2" placeholder="new Password" required=""/>
        </div>
         <div class="modal-footer">
             <input type="submit" class="btn btn-default">
        </div>
         
      </div>
      
    </div>
  </div>
  
</div>
    </form>
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

