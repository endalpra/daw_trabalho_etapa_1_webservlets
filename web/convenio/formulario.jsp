<%-- 
    Document   : formulario
    Created on : 31/03/2016, 10:01:04
    Author     : Érico
--%>
<%@page import="br.edu.ifsul.modelo.Convenio"%>
<%@page import="br.edu.ifsul.dao.ConvenioDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="convenioDao" scope="session" type="ConvenioDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Convenios</title>
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
        <h1>Edição de Convenio</h1>
        <h2><%=convenioDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletConvenio" method="POST">
            Código: <input type="text" name="id" value="<%=convenioDao.getObjetoSelecionado().getId()==null ? "": convenioDao.getObjetoSelecionado().getId()%>" size="40" readonly/>
            <br/>Nome:<input type="text" name="nome" value="<%=convenioDao.getObjetoSelecionado().getNome()==null?"":convenioDao.getObjetoSelecionado().getNome()%>" size="40"/>
            <br/>Taxa mês:<input type="text" name="taxa_mes" value="<%=convenioDao.getObjetoSelecionado().getTaxa_mes()==null?"":convenioDao.getObjetoSelecionado().getTaxa_mes() %>" size="40"/>
            <br/>Valor cobertura:<input type="text" name="valor_cobertura" value="<%=convenioDao.getObjetoSelecionado().getValor_cobertura()==null?"":convenioDao.getObjetoSelecionado().getValor_cobertura() %>" size="40"/>
            <br/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar();"/>
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar();"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
