<%-- 
    Document   : formulario
    Created on : 31/03/2016, 10:01:04
    Author     : Érico
--%>
<%@page import="br.edu.ifsul.modelo.Cliente"%>
<%@page import="br.edu.ifsul.dao.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="clienteDao" scope="session" type="ClienteDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Clientes</title>
        <script>
            function doSalvar(){
                document.getElementById("acao").value = "salvar";
                document.getElementById("form").submit();
            }
             function doCancelar(){
                document.getElementById("acao").value = "cancelar";
                document.getElementById("form").submit();
            }
        </script>
    </head>
    <body>
        <h1>Edição de Cliente</h1>
        <h2><%=clienteDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletCliente" method="POST">
            Código: <input type="text" name="id" value="<%=clienteDao.getObjetoSelecionado().getId()==null ? "": clienteDao.getObjetoSelecionado().getId()%>" size="40" readonly/>
            <br/>Nome:<input type="text" name="nome" value="<%=clienteDao.getObjetoSelecionado().getNome()==null?"":clienteDao.getObjetoSelecionado().getNome()%>" size="40"/>
            <br/>Email:<input type="text" name="email" value="<%=clienteDao.getObjetoSelecionado().getEmail()==null?"":clienteDao.getObjetoSelecionado().getEmail()%>" size="40"/>
            <br/>Endereço:<input type="text" name="endereco" value="<%=clienteDao.getObjetoSelecionado().getEndereco()==null?"":clienteDao.getObjetoSelecionado().getEndereco()%>" size="40"/>
            <br/>Cep:<input type="text" name="cep" value="<%=clienteDao.getObjetoSelecionado().getCep()==null?"":clienteDao.getObjetoSelecionado().getCep()%>" size="40"/>
            <br/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar();"/>
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar();"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
