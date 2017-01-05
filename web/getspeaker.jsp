<%-- 
    Document   : getspeaker
    Created on : Feb 17, 2016, 5:56:55 PM
    Author     : Sandeep
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
            java.sql.Connection con=null;
    String url="jdbc:mysql://localhost:3306/wp";
    String user="root";
    String password="Sunny@511";
    PreparedStatement ps; 
     out.println("testoing");
     try{  
Class.forName("com.mysql.jdbc.Driver");  
  
             con=DriverManager.getConnection(url,user,password);  
              //String s2=session.getAttribute("email_id").toString();
             // out.println(s2);
//             out.println("<form name=\"new\" action=\"\"");
//             out.println("<select name=\"email\">");
             String s=request.getParameter("val");
ps=con.prepareStatement("select * from speaker_details where topic=?");
ps.setString(1,s);
//ps.executeUpdate();
            java.sql.ResultSet rs=ps.executeQuery();
           // String str="";
            while(rs.next())
            {
            out.println("<option class=\"btn btn-primary btn-lg\" value="+rs.getString("email_sp")+">"+rs.getString("email_sp")+"</option>");
            }
//            out.println("</select");
           
            con.close();
}


  
        
        
       catch(Exception e){ 
       out.println(e.getMessage());
     }
%>
