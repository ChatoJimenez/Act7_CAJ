<%-- 
    Document   : resultado
    Created on : 20 feb. 2021, 18:02:33
    Author     : jesgu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="model.Triangulo"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado - Actividad 7</title>
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <div class="container">
            <div class="card">
                <%
                    HttpSession sesion = request.getSession(false);
                    String name = (String) sesion.getAttribute("name");
                    //Atributos del request:
                    String base = (String) request.getAttribute("base");
                    String altura = (String) request.getAttribute("altura");
                    String area = (String) request.getAttribute("area");
                    String perimetro = (String) request.getAttribute("perimetro");
                    //Cookies
                    Cookie ck[] = request.getCookies();
                    String ckBase="", ckAltura="", ckPerimetro="", ckArea="";
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
                    
                    if(name!=null){
                        out.print("<h1>¡Hola de nuevo, " + name+"!</h1>");
                    } else {
                        out.print("<h1>¡Hola!</h1>");
                    }
                %>
            </div>
            
            <div class="card">
                <h1 margin-top="20px">Respuesta</h1>
                <p> Con una base de <%=base%> 
                    y una altura de <%=altura%></p>
                <hr>
                <p> El perímetro es: <%=perimetro%></p>
                <p> El area es: <%=area%></p>    
                <a class="btn-Regresar" href="operacion.jsp">Regresar</a>
            </div>
            <%
                if(!ckBase.equals("")){
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
