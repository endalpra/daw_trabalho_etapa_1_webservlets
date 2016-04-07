<%-- 
    Document   : formulario
    Created on : 31/03/2016, 10:01:04
    Author     : Érico
--%>
<%@page import="br.edu.ifsul.modelo.Poupanca"%>
<%@page import="br.edu.ifsul.dao.PoupancaDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="poupancaDao" scope="session" type="PoupancaDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Poupanças</title>
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
        <h1>Edição de Poupanca</h1>
        <h2><%=poupancaDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletPoupanca" method="POST">
            Código: <input type="text" name="id" value="<%=poupancaDao.getObjetoSelecionado().getId()==null ? "": poupancaDao.getObjetoSelecionado().getId()%>" size="40" readonly/>
            <br/>Número:<input type="text" name="numero" value="<%=poupancaDao.getObjetoSelecionado().getNumero()==null?"":poupancaDao.getObjetoSelecionado().getNumero()%>" size="40"/>
            <br/>Saldo:<input type="text" name="saldo" value="<%=poupancaDao.getObjetoSelecionado().getSaldo()==null?"":poupancaDao.getObjetoSelecionado().getSaldo()%>" size="40"/>
            <br/>Data abertura:<input type="text" name="data_abertura" value="<%=poupancaDao.getObjetoSelecionado().getData_abertura()==null?"":poupancaDao.getObjetoSelecionado().getData_abertura()%>" size="40" />
            <br/>Ativa:<input type="text" name="ativa" value="<%=poupancaDao.getObjetoSelecionado().getAtiva()==null?"":poupancaDao.getObjetoSelecionado().getAtiva()%>" size="40"/>
            <br/>Taxa atualização:<input type="text" name="taxa_atualizacao" value="<%=poupancaDao.getObjetoSelecionado().getTaxa_atualizacao()==null?"":poupancaDao.getObjetoSelecionado().getTaxa_atualizacao()%>" size="40"/>
            <br/>Data atualização:<input type="text" name="data_atualizacao" value="<%=poupancaDao.getObjetoSelecionado().getData_atualizacao()==null?"":poupancaDao.getObjetoSelecionado().getData_atualizacao()%>" size="40"/>
            <br/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar();"/>
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar();"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
