package br.edu.ifsul.servlets;

import br.edu.ifsul.dao.AgenciaDAO;
import br.edu.ifsul.dao.ClienteDAO;
import br.edu.ifsul.dao.PoupancaDAO;
import br.edu.ifsul.modelo.Cliente;
import br.edu.ifsul.modelo.Poupanca;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Authenticator;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Érico
 */
@WebServlet(name = "ServletPoupanca", urlPatterns = {"/poupanca/ServletPoupanca"})
public class ServletPoupanca extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PoupancaDAO dao = (PoupancaDAO) request.getSession().getAttribute("poupancaDao");
        if (dao == null) {
            dao = new PoupancaDAO();
        }
        ClienteDAO daoCliente = (ClienteDAO) request.getSession().getAttribute("clienteDAO");
        if (daoCliente == null) {
            daoCliente = new ClienteDAO();
        }
        AgenciaDAO daoAgencia = (AgenciaDAO) request.getSession().getAttribute("agenciaDAO");
        if (daoAgencia == null) {
            daoAgencia = new AgenciaDAO();
        }
        String tela = "";
        String acao = request.getParameter("acao");
        if (acao == null) {
            tela = "listar.jsp";
        } else if (acao.equals("incluir")) {
            dao.setObjetoSelecionado(new Poupanca());
            dao.setMensagem("");
            tela = "formulario.jsp";
        } else if (acao.equals("alterar")) {
            Integer id = Integer.parseInt(request.getParameter("id"));
            dao.setObjetoSelecionado(dao.localizar(id));
            dao.setMensagem("");
            tela = "formulario.jsp";
        } else if (acao.equals("excluir")) {
            Integer id = Integer.parseInt(request.getParameter("id"));
            Poupanca obj = dao.localizar(id);
            if (obj != null) {
                dao.remover(obj);
            }
            tela = "listar.jsp";
        } else if (acao.equals("salvar")) {
            Integer id = null;
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (Exception e) {
                dao.setMensagem("Erro: " + br.edu.ifsul.util.Util.getMensagemErro(e));
            }
            dao.getObjetoSelecionado().setId(id);
            dao.getObjetoSelecionado().setNumero(request.getParameter("numero"));
            dao.getObjetoSelecionado().setAgencia(new AgenciaDAO().localizar(Integer.parseInt(request.getParameter("idAgencia"))));
            dao.getObjetoSelecionado().setAtiva(Boolean.parseBoolean(request.getParameter("ativa")));
            dao.getObjetoSelecionado().setCliente(new ClienteDAO().localizar(Integer.parseInt(request.getParameter("idCliente"))));
            dao.getObjetoSelecionado().setData_abertura(Calendar.getInstance());
            dao.getObjetoSelecionado().setSaldo(Double.parseDouble(request.getParameter("saldo")));
            dao.getObjetoSelecionado().setData_atualizacao(Calendar.getInstance());
            dao.getObjetoSelecionado().setTaxa_atualizacao(Double.parseDouble(request.getParameter("taxa_atualizacao")));

            if (dao.validaObjeto(dao.getObjetoSelecionado())) {
                dao.salvar(dao.getObjetoSelecionado());
                tela = "listar.jsp";
            } else {
                tela = "formulario.jsp";
            }
        } else if (acao.equals("cancelar")) {
            dao.setMensagem("");
            tela = "listar.jsp";
        }
        request.getSession().setAttribute("poupancaDao", dao);
        request.getSession().setAttribute("clienteDao", daoCliente);
        request.getSession().setAttribute("agenciaDao", daoAgencia);
        response.sendRedirect(tela);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
