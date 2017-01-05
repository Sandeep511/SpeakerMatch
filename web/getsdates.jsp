<%-- 
    Document   : getsdates
    Created on : Feb 18, 2016, 10:13:52 AM
    Author     : Sandeep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
ps=con.prepareStatement("select date from book_speaker where email=?");
ps.setString(1,s);
//ps.executeUpdate();
            java.sql.ResultSet rs=ps.executeQuery();
           // String str="";
            while(rs.next())
            {
            out.println("<option value="+rs.getString("date")+">"+rs.getString("date")+"</option>");
            }
//            out.println("</select");
           
            con.close();
}

     

  
        
        
       catch(Exception e){ 
       out.println(e.getMessage());
     }
%>
