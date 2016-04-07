<%-- 
    Document   : listar
    Created on : 31/03/2016, 09:51:24
    Author     : �rico
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifsul.modelo.Poupanca"%>
<%@page import="br.edu.ifsul.dao.PoupancaDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="poupancaDao" scope="session" type="PoupancaDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de Poupancas</title>
    </head>
    <body>
        <a href="../index.jsp">In�cio</a>
        <h1>Poupan�as</h1>
        <h2><%=poupancaDao.getMensagem()%></h2>
        <a href="ServletPoupanca?acao=incluir">Incluir</a>
        <table border=''>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>N�mero</th>
                    <th>Saldo</th>
                    <th>Data abertura</th>
                    <th>Ativa</th>
                    <th>Taxa atualiza��o</th>
                    <th>Data atualiza��o</th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <%
                    SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
                    for (Poupanca p : poupancaDao.getLista()) {
                %>
                <tr>
                    <td><%=p.getId()%></td>
                    <td><%=p.getNumero()%></td>
                    <td><%=p.getSaldo()%></td>
                    <td><%=p.getData_abertura()%></td>
                    <td><%=p.getAtiva()%></td>
                    <td><%=p.getTaxa_atualizacao()%></td>
                    <td><%=p.getData_atualizacao()%></td>
                    <td><a href="ServletPoupanca?acao=alterar&id=<%=p.getId()%>">Alterar</td>
                    <td><a href="ServletPoupanca?acao=excluir&id=<%=p.getId()%>">Excluir</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
