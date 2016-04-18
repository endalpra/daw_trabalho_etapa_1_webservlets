<%-- 
    Document   : formulario
    Created on : 31/03/2016, 10:01:04
    Author     : Érico
--%>
<%@page import="br.edu.ifsul.modelo.Agencia"%>
<%@page import="br.edu.ifsul.dao.AgenciaDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="agenciaDao" scope="session" type="AgenciaDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Agencias</title>
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
        <h1>Edição de Agencia</h1>
        <h2><%=agenciaDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletAgencia" method="POST">
            Código: <input type="text" name="id" value="<%=agenciaDao.getObjetoSelecionado().getId()==null ? "": agenciaDao.getObjetoSelecionado().getId()%>" size="40" readonly/>
            <br/>Número:<input type="text" name="numero" value="<%=agenciaDao.getObjetoSelecionado().getNumero()==null?"":agenciaDao.getObjetoSelecionado().getNumero()%>" size="40"/>
            <br/>Nome gerente:<input type="text" name="nome_gerente" value="<%=agenciaDao.getObjetoSelecionado().getNome_gerente()==null?"":agenciaDao.getObjetoSelecionado().getNome_gerente()%>" size="40"/>
            <br/>Endereço:<input type="text" name="endereco" value="<%=agenciaDao.getObjetoSelecionado().getEndereco()==null?"":agenciaDao.getObjetoSelecionado().getEndereco()%>" size="40"/>
            <br/>Cep:<input type="text" name="cep" value="<%=agenciaDao.getObjetoSelecionado().getCep()==null?"":agenciaDao.getObjetoSelecionado().getCep()%>" size="40"/>
            <br/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar();"/>
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar();"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
