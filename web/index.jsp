<%-- 
    Document   : index
    Created on : 20 feb. 2021, 17:52:33
    Author     : jesgu
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Actividad 7</title>
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession(false);
            String name=null;
            Enumeration e = sesion.getAttributeNames();
            if(e.hasMoreElements()){
                name = (String) sesion.getAttribute("name");
            }
        %>
        <div class ="container ">
            <div class ="card  mt-10">
                <%
                    if(name!=null){
                %>
                <h2 class="saludo">¡Hola, <%=name%>!</h2>
                <a class="btn-Regresar" href="controller?btnIndex=1">Entrar</a>
                <%} else {%>
                <h2>¡Hola!</h2>
                <form action="controller" method="post">
                    <input class="text-box" name="name" placeholder="Escribe tu nombre">
                    <input class="btn" type="submit" name="btnIndex" value="Guardar nombre">
                </form>
                <%}%>
            </div>
        </div>
    </body>
</html>