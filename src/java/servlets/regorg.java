package servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
public class regorg extends HttpServlet {

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
            out.println("<title>Servlet regorg</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet regorg at " + request.getContextPath() + "</h1>");
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
       // processRequest(request, response);
         try {
            // processRequest(request, response);
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out=response.getWriter();
            String OrgName = request.getParameter("OrgName");
            String email = request.getParameter("email");
            //String dob=request.getParameter("dob");
           // out.println("Name "+Name+" Email  "+email_id+" DOB "+dob);
         //   out.println("not connected");
            Class.forName("com.mysql.jdbc.Driver");  
            try {
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wp","root","Sunny@511");
                 Statement insert;
                 
                insert = con.createStatement();
               // out.println("connected");
//                 String Name = request.getParameter("Name");
//                String email_id = request.getParameter("email_id");
               // out.println("KIng1");
                 String password1=request.getParameter("password1");
                 // String mob=request.getParameter("mob");
//                  String dob=request.getParameter("dob");
                  String cou=request.getParameter("cou");
                  String adress=request.getParameter("adress");
                  String type=request.getParameter("type");
                                //  out.println(dob);

                    String sql="insert into wp.organasation values('"+OrgName+"','"+email+"','"+password1+"','"+cou+"','"+adress+"','"+type+"')";
                insert.executeUpdate(sql);
                String sql1="insert into wp.login values('"+email+"','"+password1+"','"+type+"')";
                insert.executeUpdate(sql1);
                out.println(OrgName);
                out.println(email);
                out.println(password1);
                out.println(cou);
                out.println(adress);
                //out.println("efsa,fhjdsjhhbksjdflifuhjkfdjivu8ureoijkfdiu");
                 // String skills=request.getParameter(Name);
//                Enumeration e=request.getParameterNames();
//                while(e.hasMoreElements())
//                {
//                    Object obj=e.nextElement();                    
//                        String f=(String)obj;
//                        String fv=request.getParameter(f);
//                        out.println(f+":"+fv+"<br>");
//                    
                
                RequestDispatcher rd=request.getRequestDispatcher("Org_welcome.jsp");
                rd.forward(request, response);
                out.close();
            } catch (SQLException ex) {
                Logger.getLogger(regspeaker.class.getName()).log(Level.SEVERE, null, ex);
                out.println(ex.getMessage());
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(regspeaker.class.getName()).log(Level.SEVERE, null, ex);
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
