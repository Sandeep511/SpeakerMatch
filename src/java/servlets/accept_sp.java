/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rajeev
 */
public class accept_sp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet accept_sp</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet accept_sp at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       // processRequest(request, response);
          java.sql.Connection con=null;
    String url="jdbc:mysql://localhost:3306/wp";
    String user="root";
    String password="Sunny@511";
    PreparedStatement ps,ps2;
    PrintWriter out = response.getWriter();
        HttpSession s=request.getSession(true);
       String s2=s.getAttribute("email_sp").toString(); 
    try{  
Class.forName("com.mysql.jdbc.Driver");  
  
             con=DriverManager.getConnection(url,user,password);  
             
  
//here sonoo is database name, root is username and password  
//out.println("<h1>Servlet Myservelet at " + request.getParameter("email") + "</h1>");

  String str= request.getParameter("date");
  String status="Accepted";
  ps= con.prepareStatement("insert into accept_sp values(?,?,?,?,?)");
  ps.setString(1,s2);
  ps.setString(2, request.getParameter("Org_name"));
  ps.setString(3,request.getParameter("topic"));
  ps.setString(4, str);
  ps.setString(5, status);

    ps.executeUpdate();
     ps2=con.prepareStatement("delete  from book_speaker where date=?");
    ps2.setString(1,str);
    ps2.executeUpdate();
    RequestDispatcher rd=request.getRequestDispatcher("Sp_notification.jsp");
    rd.include(request, response);
    out.println("accepted");
              
            
            
   
  //ps2.setString(1,request.getParameter("t_id"));
  //ps2.setString(2,);
  //ps2.setString(3,"O");
  
//rd.forward(request, response);
        }
        catch(Exception e){ System.out.println(e);
        out.println(e.getMessage());
        }
       // processRequest(request, response);
    }
       
        
        
        
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
