<%-- 
    Document   : tickets_history
    Created on : 21 Feb, 2016, 11:54:16 PM
    Author     : admin
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tickets History</title>
    </head>
    <body>
        
        <table align="center" cellspacing="15">
            <tr>
                <th> Ticket No :</th>
                <th> Event name :</th>
            </tr>
        <%@include file="User_welcome.jsp" %>
        <%
            java.sql.Connection con=null;
            String url="jdbc:mysql://localhost:3306/wp";
            String user="root";
            String password="Sunny@511";
            PreparedStatement ps,ps2;
            try
            {
                HttpSession s=request.getSession(true);
              String s2=session.getAttribute("email_sp").toString();
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection(url,user,password);

                ps=con.prepareStatement("select * from wp.book_tickets where email_user=?");
                ps.setString(1, s2);
                java.sql.ResultSet rs=ps.executeQuery();
               
            
        %>
        <%
           while(rs.next()!=false)
            {
                
                String name=rs.getString("e_name");
                String ticket_id=rs.getString("ticket_id");
            %>
            
            <tr>
                <td><%=ticket_id%></td>
                <td><%=name%></td>
            </tr>
            
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
    </body>
</html>
