<%-- 
    Document   : operacion
    Created on : 26 mar. 2021, 16:51:56
    Author     : jesgu
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Operación</title>
    </head>
    <body>
        <div class ="container">
            <div class ="card">
                <%
                    HttpSession sesion = request.getSession(false);
                    Enumeration e = sesion.getAttributeNames();
                    if(e.hasMoreElements()){
                        out.print("<h1> ¡Hola, " + sesion.getAttribute("name") + "!");
                    }
                %>
            </div>
            <%
                Cookie ck[] = request.getCookies();
                String ckBase=null, ckAltura=null, ckPerimetro=null, ckArea=null;
                if(ck!=null){
                    for(int i = 0; i<ck.length;i++){
                        if(ck[i].getName().equals("ckBase")) {
                            ckBase = ck[i].getValue();
                        }
                        if(ck[i].getName().equals("ckAltura")) {
                            ckAltura = ck[i].getValue();
                        }
                        if(ck[i].getName().equals("ckPerimetro")) {
                            ckPerimetro = ck[i].getValue();
                        }
                        if(ck[i].getName().equals("ckArea")) {
                            ckArea = ck[i].getValue();
                        }
                    }
                }
                
            %>
            <div class="card">
                <p class="question">¿Quieres calcular el perímetro y área de un triángulo?</p>
                <form action="controller" method="post">
                    <input class="text-box" name="base" type="text" placeholder="Escribe la base">
                    <input class="text-box" name="altura" type="text" placeholder="Escribe la altura">
                    <input class="btn" type="submit" name="btnCalcular" value="Calcular">
                </form>
            </div>
            <%
                if(ckBase!=null){
            %>
            <div class="card anterior">
                <p class="question">Estos son los datos de tu cálculo anterior:</p>
                <p><b>Base:</b> <%=ckBase%></p>
                <p><b>Altura:</b> <%=ckAltura%></p>
                <p><b>Perímetro:</b> <%=ckPerimetro%></p>
                <p><b>Área:</b> <%=ckArea%></p>
            </div>
            <%}%>
        </div>
    </body>
</html>
