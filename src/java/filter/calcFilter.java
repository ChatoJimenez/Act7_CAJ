/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author jesgu
 */
public class calcFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest sRequest = (HttpServletRequest) request;
        System.out.println("Estoy en el filtro");
        PrintWriter out = response.getWriter();
        
        if(request.getParameter("btnCalcular")!=null){
            int base = Integer.parseInt(sRequest.getParameter("base"));
            int altura = Integer.parseInt(sRequest.getParameter("altura"));
            if (base<0 || altura<0){
                out.print("Error: No puedes calcular con números negativos");
            } else {
                chain.doFilter(request, response);
            }
        }
        
        
    }

    @Override
    public void destroy() {
        Filter.super.destroy(); //To change body of generated methods, choose Tools | Templates.
    }
    
}
