package br.edu.ifsul.servlets;

import br.edu.ifsul.dao.AgenciaDAO;
import br.edu.ifsul.modelo.Agencia;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Érico
 */
@WebServlet(name = "ServletAgencia", urlPatterns = {"/agencia/ServletAgencia"})
public class ServletAgencia extends HttpServlet {

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
       
         AgenciaDAO dao = (AgenciaDAO) request.getSession().getAttribute("agenciaDao");
        if(dao == null){
            dao = new AgenciaDAO();
        }
        String tela = "";
        String acao = request.getParameter("acao");
        if(acao==null){
            tela = "listar.jsp";
        }else if(acao.equals("incluir")){
            dao.setObjetoSelecionado(new Agencia());
            dao.setMensagem("");
            tela = "formulario.jsp";
        }else if(acao.equals("alterar")){
            Integer id = Integer.parseInt(request.getParameter("id"));
            dao.setObjetoSelecionado(dao.localizar(id));
            dao.setMensagem("");
            tela = "formulario.jsp";
        }else if(acao.equals("excluir")){
            Integer id = Integer.parseInt(request.getParameter("id"));
            Agencia obj = dao.localizar(id);
            if(obj!= null){
                dao.remover(obj);
            }
            tela = "listar.jsp";
        }else if(acao.equals("salvar")){
                Integer id = null;
                try{
                    id = Integer.parseInt(request.getParameter("id"));
                }catch(Exception e){
                    dao.setMensagem("Erro: "+br.edu.ifsul.util.Util.getMensagemErro(e));
                }
                dao.getObjetoSelecionado().setId(id);
                dao.getObjetoSelecionado().setNumero(request.getParameter("numero")); 
                dao.getObjetoSelecionado().setCep(request.getParameter("cep"));
                //dao.getObjetoSelecionado().setConvenios(request.getParameter("convenios"));
                //dao.getObjetoSelecionado().setTelefones(request.getParameter("cep"));
                dao.getObjetoSelecionado().setNome_gerente(request.getParameter("nome_gerente"));
                dao.getObjetoSelecionado().setEndereco(request.getParameter("endereco"));                
                if(dao.validaObjeto(dao.getObjetoSelecionado())){
                    dao.salvar(dao.getObjetoSelecionado());
                    tela = "listar.jsp";
                }else{
                    tela = "formulario.jsp";
                }
            }else if(acao.equals("cancelar")){
                    dao.setMensagem("");
                    tela = "listar.jsp";
            }
            request.getSession().setAttribute("agenciaDao", dao);
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
