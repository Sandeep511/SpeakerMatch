<%-- 
    Document   : get_events
    Created on : Feb 19, 2016, 4:33:25 PM
    Author     : Rajeev
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
  
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet"/>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
</head>
<style>
    
    
</style>

<body>
    <%@include file="User_welcome.jsp" %>
     <% 
        
        
        java.sql.Connection con=null;
        String url="jdbc:mysql://localhost:3306/wp";
        String user="root";
        String password="Sunny@511";
        PreparedStatement ps,ps2;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(url,user,password);
            
            ps=con.prepareStatement("select * from wp.events");
            
            java.sql.ResultSet rs=ps.executeQuery();
            ps2=con.prepareStatement("select * from wp.avil_seat where e_name=?");
            
            
            %>
           
<div class="container">
  <!-- Trigger the modal with a button -->
   
  <%
      int i=1;
            while(rs.next()!=false)
            {
                
                String name=rs.getString("e_name");
                ps2.setString(1, name);
                java.sql.ResultSet rs1=ps2.executeQuery();
                if(rs1.next()!=false)
                {
            %>
    
   
  </br>
  </br>
  
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"><%out.println(rs.getString("e_name"));%></button>

  <!-- Modal -->
  <div>
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog" >
     
      <!-- Modal content-->
      <div class="modal-content">
          <form role="get_events" action="Book_tickets" method="post">
        <div class="modal-header">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Events</h4>
        </div>
        <div class="modal-body">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <p >Events</p>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>"<%=name%>"</label>
        </div>
          
          <table id="tab" class="bg-success" align="center" cellpadding = "10">
              <tr>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <td>Event Name </td>
        <td><input type="text" name="e_name" value="<%=name%>" class="form-control" readonly="readonly"></td>
    </tr>
    <tr>
        <td class="">Orgnisation Name </td>
        <td><input type="text" name="First_Name" value="<%=rs.getString("org_name")%>" class="form-control" readonly="readonly"></td>
    </tr>
    <tr>
        <td>Speaker Name : </td>
        <td><input type="text" name="First_Name" value="<%=rs.getString("sp_name")%>" class="form-control" readonly="readonly"></td>
    </tr>
    <tr>
        <td>Topic : </td>
        <td><input type="text" name="First_Name" value="<%=rs.getString("topic")%>" class="form-control" readonly="readonly"></td>
    </tr>
    <tr>
        <td>Date : </td>
        <td><input type="text" name="First_Name" value="<%=rs.getString("date")%>" class="form-control" readonly="readonly"></td>
    </tr>
    <tr>
        <td>Email : </td>
        <td><input type="text" name="First_Name"value="<%=rs.getString("ad_id")%>" class="form-control" readonly="readonly"></td>
    </tr>
    <tr>
        <td>Mobile : </td>
        <td><input type="text" name="First_Name"value="<%=rs.getString("mob")%>" class="form-control" readonly="readonly"></td>
    </tr>
    <tr>
        <td>City : </td>
        <td><input type="text" name="First_Name" value="<%=rs.getString("city")%>" class="form-control" readonly="readonly"></td>
    </tr>
    <tr>
        <td>Address : </td>
        <td><input type="text" name="First_Name" value="<%=rs.getString("add")%>" class="form-control" readonly="readonly"></td>
    </tr>
    <tr>
        <td>Available Seats : </td>
        <td><input type="text" name="First_Name" value="<%=rs1.getString("avi_seats")%>" class="form-control" readonly="readonly"></td>
    </tr>
    
              
              <div class="modal-footer">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <input type="submit" class="bg-success" name="Book" value="Book">
        </div>
              
              
          </table>
         
          </form>
      </div>
    
    </div>
  </div>
  </div>
    <% }
         
}
%>
 
</div>
  

 
        <%
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

</body>
</html>

