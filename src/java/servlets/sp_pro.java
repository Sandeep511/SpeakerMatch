/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rajeev
 */
public class sp_pro extends HttpServlet {

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
            out.println("<title>Servlet sp_pro</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sp_pro at " + request.getContextPath() + "</h1>");
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
        try {
            //processRequest(request, response);
            PrintWriter out=response.getWriter();
            response.setContentType("text/html;charset=UTF-8");
            Class.forName("com.mysql.jdbc.Driver");
             out.println("1connected");
            try {
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wp","root","Sunny@511");
                  Statement insert=con.createStatement();
                   out.println("2connected");
                  String email_sp= request.getParameter("email_sp");
                  String topic=request.getParameter("topic");
                  String exp=request.getParameter("exp");
                  String coff_att=request.getParameter("conf_att");
                  String description=request.getParameter("description");
                  
            String sql="insert into wp.speaker_details values('"+email_sp+"','"+topic+"','"+exp+"','"+coff_att+"','"+description+"')";
            insert.executeUpdate(sql);
            String sql1="insert into wp.topics values('"+topic+"')";
            insert.executeUpdate(sql1);
            out.println("connected");
            } catch(Exception e) {
//                Logger.getLogger(sp_pro.class.getName()).log(Level.SEVERE, null, ex);
                out.println(e.getMessage());
            }
          
            
            
             RequestDispatcher rd=request.getRequestDispatcher("Sp_welcomePage.jsp");
                rd.forward(request, response);
            
            
            
            
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(sp_pro.class.getName()).log(Level.SEVERE, null, ex);
        }
                 
          
          
          
        
        
        
        
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
