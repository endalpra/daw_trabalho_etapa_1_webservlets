<%-- 
    Document   : listar
    Created on : 31/03/2016, 09:51:24
    Author     : Érico
--%>

<%@page import="br.edu.ifsul.modelo.Convenio"%>
<%@page import="br.edu.ifsul.modelo.Telefone"%>
<%@page import="br.edu.ifsul.modelo.Cliente"%>
<%@page import="br.edu.ifsul.dao.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="clienteDao" scope="session" type="ClienteDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de Clientes</title>
    </head>
    <body>
        <a href="../index.jsp">Início</a>
        <h1>Clientes</h1>
        <h2><%=clienteDao.getMensagem()%></h2>
        <a href="ServletCliente?acao=incluir">Incluir</a>
        <table border=''>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Cep</th>
                    <th>Email</th>
                    <th>Endereço</th>
                    <th>Convenios</th>
                    <th>Telefones</th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Cliente c : clienteDao.getLista()) {
                %>
                <tr>
                    <td><%=c.getId()%></td>
                    <td><%=c.getNome()%></td>
                    <td><%=c.getCep()%></td>
                    <td><%=c.getEmail()%></td>
                    <td><%=c.getEndereco()%></td> 
                    <td>
                        <%
                            for (Convenio co : c.getConvenios()) {
                        %>
                        <%=co.getNome()+" "%>
                        <%}%>
                    </td>
                    <td>
                        <%
                            for (Telefone t : c.getTelefones()) {
                        %>
                        <%="("+t.getCodigo_area()+")"+ t.getTelefoneId().getNumero()+" "%>
                        <%}%>
                    </td>
                    <td><a href="ServletCliente?acao=alterar&id=<%=c.getId()%>">Alterar</td>
                    <td><a href="ServletCliente?acao=excluir&id=<%=c.getId()%>">Excluir</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
