<%-- 
    Document   : Create_event
    Created on : Feb 19, 2016, 12:08:27 PM
    Author     : Rajeev
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="css/animate.min.css" type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/creative.css" type="text/css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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
    </br>
    </br>
    </br>
    </br>
    </br>
    <%
        
//        out.println("dfgjhjk");
//             out.println("asdfghjkl");
             java.sql.Connection con=null;
    String url="jdbc:mysql://localhost:3306/wp";
    String user="root";
    String password="Sunny@511";
    PreparedStatement ps,ps1,ps2; 
 try{  
 Class.forName("com.mysql.jdbc.Driver");  
            HttpSession s=request.getSession(true);
              String s2=session.getAttribute("email_sp").toString();
             con=DriverManager.getConnection(url,user,password);  
            ps=con.prepareStatement("select * from wp.accept_sp where Org_name=?");
            ps.setString(1, s2);
            String date=null,topic=null,email=null,name=null,OrgName=null;
//             out.println("select query");
            java.sql.ResultSet rs=ps.executeQuery();
            if(rs.next()){
            date=rs.getString("date");
            topic=rs.getString("topic");
            email=rs.getString("email_sp");
//           out.println(date);
//           out.println(email);
            }
           
            ps1=con.prepareStatement("select * from wp.speaker where email_sp=?");
//            out.println(email);
            ps1.setString(1, email);
            java.sql.ResultSet rs1=ps1.executeQuery();
            if(rs1.next()){
             name=rs1.getString("Name");
//             out.println("name-->"+name);
            }
            ps2=con.prepareStatement("select * from wp.organasation where email=?");
            ps2.setString(1, s2);
            java.sql.ResultSet rs2=ps2.executeQuery();
            if(rs2.next()){ 
            OrgName=rs2.getString("OrgName");
            }
         
            out.println(date+"-->"+topic+"-->"+email+"-->"+name+"-->"+OrgName);
             %>

<div class="container">
    <h1 class="well">Create Event</h1>
	<div class="col-lg-12 well">
	<div class="row">
            <form name="event_cre" action="CreateEvent" method="post">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Event name</label>
                                                                <input type="text" name="e_name" placeholder="Event_name" class="form-control">
							</div>
							<div class="col-sm-6 form-group">
								<label>Organisation Name</label>
                                                                <input type="text" name="org_name" placeholder="Org_name" value="<%=OrgName%>" class="form-control">
							</div>
						</div>					
						<div class="form-group">
							<label>Address</label>
                                                        <textarea placeholder="Enter Address Here.." name="add" rows="3" class="form-control"></textarea>
						</div>	
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>City</label>
                                                                <input type="text" name="city" placeholder="Enter City Name Here.." class="form-control">
							</div>	
							<div class="col-sm-4 form-group">
								<label>Speaker_name</label>
                                                                <input type="text" name="sp_name" placeholder="Speaker_name" value="<%=name%>" class="form-control">
							</div>	
							<div class="col-sm-4 form-group">
								<label>Speaker_id</label>
                                                                <input type="email" name="sp_id" placeholder="Speaker_email" value="<%=email%>" class="form-control">
							</div>		
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Org_id</label>
                                                                <input type="text" name="org_id" placeholder="Organisation_email" value="<%=s2 %>" class="form-control">
							</div>		
							<div class="col-sm-6 form-group">
								<label>Date</label>
                                                                <input type="text" name="date" placeholder=" Date" value="<%=date%>" class="form-control">
							</div>	
						</div>						
					<div class="form-group">
						<label>Contact- Number</label>
                                                <input type="text" name="mob" placeholder="Enter Phone Number Here.." class="form-control">
					</div>		
					<div class="form-group">
						<label>Email Address</label>
                                                <input type="text" name="ad_id" placeholder="Enter Email Address Here.." class="form-control">
					</div>	
					<div class="form-group">
						<label>Topic</label>
                                                <input type="text" name="topic" placeholder="Topic_Name" value="<%=topic%>" class="form-control">
                                                
					</div>
                                                <div class="form-group">
						<label>Avilable seats</label>
                                                <input type="text" name="avi_seats" placeholder="Avilable_seats" class="form-control">
                                                </div>
					<button type="submit" class="btn btn-lg btn-info">Submit</button>					
					</div>
				</form> 
				</div>
	</div>
	</div>
               <%
                
            
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

