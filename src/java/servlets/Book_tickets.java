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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class Book_tickets extends HttpServlet {

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
            out.println("<title>Servlet Book_tickets</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Book_tickets at " + request.getContextPath() + "</h1>");
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
            int n;
            //processRequest(request, response);
            PrintWriter out=response.getWriter();
            response.setContentType("text/html;charset=UTF-8");
            Class.forName("com.mysql.jdbc.Driver");
             out.println("1connected");
            try {
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wp","root","Sunny@511");
                  Statement insert=con.createStatement();
                   out.println("2connected");
                   HttpSession s=request.getSession(true);
            String s2=s.getAttribute("email_sp").toString();
               
                  String e_name = request.getParameter("e_name");
                 String ticket_id = null;
                  
             PreparedStatement ps2=con.prepareStatement("insert into wp.book_tickets values(?,?,?)");
             ps2.setString(1, s2);
             ps2.setString(2, e_name);
             ps2.setString(3, ticket_id);
//            String sql="insert into wp.book_tickets values('"+s2+"','"+e_name+"','"+ticket_id+"')";
//            insert.executeUpdate(sql);
             
            String sql1="select * from avil_seat where e_name='"+e_name+"'";
            ResultSet rs = insert.executeQuery(sql1);
            PreparedStatement ps=con.prepareStatement("update  avil_seat set avi_seats=? where e_name=?");
            while(rs.next()){
                n=Integer.parseInt(rs.getString("avi_seats"))-1;
                ps.setInt(1, n);
                ps.setString(2,e_name);
                ps.executeUpdate();                
            }
            
            ps2.executeUpdate();
            
            
              RequestDispatcher rd=request.getRequestDispatcher("get_events.jsp");
                rd.forward(request, response);
            
            
            } catch(Exception e) {
//                Logger.getLogger(sp_pro.class.getName()).log(Level.SEVERE, null, ex);
                out.println(e.getMessage());
            }
          
            
            
          
            
            
            
            
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
