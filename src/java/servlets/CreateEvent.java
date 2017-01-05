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
public class CreateEvent extends HttpServlet {

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
            out.println("<title>Servlet CreateEvent</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateEvent at " + request.getContextPath() + "</h1>");
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
                  String e_name= request.getParameter("e_name");
                  String org_name = request.getParameter("org_name");
                  String add=request.getParameter("add");
                  String city=request.getParameter("city");
                  String sp_name=request.getParameter("sp_name");
                  String sp_id= request.getParameter("sp_id");
                  String org_id = request.getParameter("org_id");
                  String date=request.getParameter("date");
                  String mob=request.getParameter("mob");
                  String ad_id=request.getParameter("ad_id");
                  String topic=request.getParameter("topic");
                  String avi_seats=request.getParameter("avi_seats");
                  
                  
            String sql="insert into wp.events values('"+e_name+"','"+org_name+"','"+add+"','"+city+"','"+sp_name+"','"+sp_id+"','"+org_id+"','"+date+"','"+mob+"','"+ad_id+"','"+topic+"')";
            insert.executeUpdate(sql);
            out.println("event created");
           String sql1="delete from accept_sp where email_sp='"+sp_id+"'";
           insert.executeUpdate(sql1);
           out.println("accept table deleted");
           String sql2="delete from req_sp where email_sp='"+sp_id+"'";
           insert.executeUpdate(sql2);
           out.println("request table deleted");
           String sql3="insert into wp.avil_seat values('"+e_name+"','"+avi_seats+"')";
           insert.executeUpdate(sql3);
            
            } catch(Exception e) {
//                Logger.getLogger(sp_pro.class.getName()).log(Level.SEVERE, null, ex);
                out.println(e.getMessage());
            }
          
            
            
            RequestDispatcher rd=request.getRequestDispatcher("Org_welcome.jsp");
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
