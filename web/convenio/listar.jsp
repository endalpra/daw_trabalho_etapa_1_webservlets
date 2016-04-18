<%-- 
    Document   : listar
    Created on : 31/03/2016, 09:51:24
    Author     : Érico
--%>

<%@page import="br.edu.ifsul.modelo.Poupanca"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifsul.modelo.Convenio"%>
<%@page import="br.edu.ifsul.modelo.Telefone"%>
<%@page import="br.edu.ifsul.modelo.Convenio"%>
<%@page import="br.edu.ifsul.dao.ConvenioDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="convenioDao" scope="session" type="ConvenioDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de Convenios</title>
    </head>
    <body>
        <a href="../index.jsp">Início</a>
        <h1>Convenios</h1>
        <h2><%=convenioDao.getMensagem()%></h2>
        <a href="ServletConvenio?acao=incluir">Incluir</a>
        <table border=''>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Taxa mês</th>
                    <th>Valor cobertura</th>
                    <th>Data início</th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <%
                         SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
                    for (Convenio c : convenioDao.getLista()) {
                %>
                <tr>
                    <td><%=c.getId()%></td>
                    <td><%=c.getNome()%></td>
                    <td><%=c.getTaxa_mes() %></td>
                    <td><%=c.getValor_cobertura() %></td>
                    <td><%=formatador.format(c.getData_inicio().getTime()) %></td> 
                    <td><a href="ServletConvenio?acao=alterar&id=<%=c.getId()%>">Alterar</td>
                    <td><a href="ServletConvenio?acao=excluir&id=<%=c.getId()%>">Excluir</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
