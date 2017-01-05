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
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class loginSpeaker extends HttpServlet {

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
            out.println("<title>Servlet loginSpeaker</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginSpeaker at " + request.getContextPath() + "</h1>");
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
        
        try {
            
            PrintWriter out = response.getWriter();
            String s=null,password1=null;
            RequestDispatcher rd = null;
            
            response.setContentType("text/html");
             String email_sp=request.getParameter("email_sp");
                String password12=request.getParameter("Password1");
               HttpSession session=request.getSession();
                session.setAttribute("email_sp", request.getParameter("email_sp"));
          //  out.println("not connected");
            Class.forName("com.mysql.jdbc.Driver");
            try {
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wp","root","Sunny@511");
                Statement sp=con.createStatement();
                String sql="Select * from wp.login where email='"+email_sp+"' and pasword1='"+password12+"'";
                ResultSet rs;
                rs = sp.executeQuery(sql);
                
                while(rs.next())
                    
                {
                    password1=rs.getString("pasword1");
                    out.println("email id-->"+rs.getString("email"));
                    out.println("password1-->"+password1);
                    s=rs.getString("type");
                }
                if(password12.equals(password1))
                {
                    if(s.equals("s"))
                    {
                        rd = request.getRequestDispatcher("Sp_welcomePage.jsp");
                        rd.forward(request, response);
                    }
                    else if(s.equals("o"))
                    {
                        rd=request.getRequestDispatcher("Org_welcome.jsp");
                        rd.forward(request, response);
                    }
                    
                    else
                    {
                        rd=request.getRequestDispatcher("User_page.jsp");
                        rd.forward(request, response);
                    }
                      
                }
                else
                {
                    out.println("<script> alert('Invalid password....!');"+"window.location='home.html'</script>");
                }
                
            }
            catch (SQLException ex) 
            {
                Logger.getLogger(loginSpeaker.class.getName()).log(Level.SEVERE, null, ex);
                out.println(ex);
            }
          
        } 
        catch (ClassNotFoundException ex) 
        {
            Logger.getLogger(loginSpeaker.class.getName()).log(Level.SEVERE, null, ex);
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
