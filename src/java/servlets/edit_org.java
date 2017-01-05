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
public class edit_org extends HttpServlet {

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
            out.println("<title>Servlet edit_org</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet edit_org at " + request.getContextPath() + "</h1>");
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
            throws ServletException, IOException {
       //processRequest(request, response);
        PrintWriter out=response.getWriter();
        try {
            // processRequest(request, response);
            response.setContentType("text/html;charset=UTF-8");
           
            
    //        out.println("Name "+Name+" Email  "+email_id+" DOB "+dob);
            //out.println("not connected");
            Class.forName("com.mysql.jdbc.Driver");  
            
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wp","root","Sunny@511");
                 Statement insert;
                 
                insert = con.createStatement();
                
            String OrgName = request.getParameter("OrgName");
            String email = request.getParameter("email");
            String password1=request.getParameter("password1");
            String cou=request.getParameter("cou");
            String adress=request.getParameter("adress");
            String type=request.getParameter("type");
//            out.println(dob);

//            String sql="insert into wp.speaker values('"+Name+"','"+email_id+"','"+password1+"','"+mob+"','"+dob+"','"+country+"','"+gender+"','"+type+"')";
            

            String sql ="Update wp.organasation set OrgName='"+OrgName+"',password1='"+password1+"',cou='"+cou+"',adress='"+adress+"' where email='"+email+"'";
            insert.executeUpdate(sql);
            
                
               
                   out.println("dispatcher");
                  RequestDispatcher rd;
            rd = request.getRequestDispatcher("Org_welcome.jsp");
                //out.println("dispatcher welcome page");
                  rd.forward(request, response);
                  //out.println("dispatcher failed");
//            RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
//            rs.forward(request,response);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(regspeaker.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            out.println(ex.getMessage());
        }  catch (SQLException ex) {
                Logger.getLogger(regspeaker.class.getName()).log(Level.SEVERE, null, ex);
                ex.printStackTrace();
                out.println(ex.getMessage());
        }
        catch(ServletException e)
        {
            e.printStackTrace();
        out.println(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            out.println(e.getMessage());
        }
        finally{
        out.close();
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
