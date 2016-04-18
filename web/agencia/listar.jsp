<%-- 
    Document   : listar
    Created on : 31/03/2016, 09:51:24
    Author     : Érico
--%>

<%@page import="br.edu.ifsul.modelo.Convenio"%>
<%@page import="br.edu.ifsul.modelo.Telefone"%>
<%@page import="br.edu.ifsul.modelo.Agencia"%>
<%@page import="br.edu.ifsul.dao.AgenciaDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="agenciaDao" scope="session" type="AgenciaDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de Agencias</title>
    </head>
    <body>
        <a href="../index.jsp">Início</a>
        <h1>Agencias</h1>
        <h2><%=agenciaDao.getMensagem()%></h2>
        <a href="ServletAgencia?acao=incluir">Incluir</a>
        <table border=''>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Número</th>
                    <th>Nome gerente</th>
                    <th>Endereço</th>
                    <th>Cep</th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Agencia c : agenciaDao.getLista()) {
                %>
                <tr>
                    <td><%=c.getId()%></td>
                    <td><%=c.getNumero()%></td>
                    <td><%=c.getNome_gerente()%></td>
                    <td><%=c.getEndereco()%></td>
                    <td><%=c.getCep()%></td>                    
                    <td><a href="ServletAgencia?acao=alterar&id=<%=c.getId()%>">Alterar</td>
                    <td><a href="ServletAgencia?acao=excluir&id=<%=c.getId()%>">Excluir</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
