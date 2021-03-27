/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Triangulo;

/**
 *
 * @author jesgu
 */
@WebServlet(name = "controller", urlPatterns = {"/controller"})
public class controller extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            
            if(request.getParameter("btnIndex")!=null){
                if(request.getSession(false).getAttribute("name")==null){
                    String nombre = request.getParameter("name");
                    HttpSession sesion = request.getSession(false);
                    sesion.setAttribute("name", nombre);
                }
                request.getRequestDispatcher("/operacion.jsp").forward(request, response);
            } else if(request.getParameter("btnCalcular")!=null) {
                String base = request.getParameter("base");
                String altura = request.getParameter("altura");
                Triangulo triangulo = new Triangulo(base, altura);
                triangulo.calcularPerimetro();
                triangulo.calcularArea();
                //Cookies que serán usadas la próxima vez
                Cookie ck = new Cookie("ckBase", triangulo.getBase()+"");
                response.addCookie(ck);
                ck = new Cookie("ckAltura",triangulo.getAltura()+"");
                response.addCookie(ck);
                ck = new Cookie("ckArea",triangulo.getArea()+"");
                response.addCookie(ck);
                ck = new Cookie("ckPerimetro",triangulo.getPerimetro()+"");
                response.addCookie(ck);
                //Atributos
                request.setAttribute("base", triangulo.getBase()+"");
                request.setAttribute("altura", triangulo.getAltura()+"");
                request.setAttribute("perimetro", triangulo.getPerimetro()+"");
                request.setAttribute("area", triangulo.getArea()+"");
                request.getRequestDispatcher("/resultado.jsp").forward(request, response);
            } 
            
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
        processRequest(request, response);
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
