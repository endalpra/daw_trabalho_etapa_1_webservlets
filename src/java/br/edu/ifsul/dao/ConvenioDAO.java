package br.edu.ifsul.dao;

import br.edu.ifsul.jpa.EntityManagerUtil;
import br.edu.ifsul.modelo.Convenio;
import br.edu.ifsul.util.Util;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;

/**
 *
 * @author Érico
 */
public class ConvenioDAO {
     private Convenio objetoSelecionado;
    private String mensagem = "";
    private EntityManager em;

    public ConvenioDAO() {
        em = EntityManagerUtil.getEntityManager();
    }

    public boolean validaObjeto(Convenio obj) {
        Validator validador = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<Convenio>> erros = validador.validate(obj);
        if (erros.size() > 0) {
            mensagem = "";
            mensagem += "Objeto com erros:<br/>";
            for (ConstraintViolation<Convenio> erro : erros) {
                mensagem += "Erro: " + erro.getMessage() + "<br/>";
            }
            return false;
        } else {
            return true;
        }
    }

    public List<Convenio> getLista() {
        return em.createQuery("from Convenio order by nome").getResultList();
    }

    public boolean salvar(Convenio obj) {
        try {
            em.getTransaction().begin();
            if (obj.getId() == null) {
                em.persist(obj);
            } else {
                em.merge(obj);
            }
            em.getTransaction().commit();
            mensagem = "Objeto persistido com sucesso!";
            return true;
        } catch (Exception e) {
            if (em.getTransaction().isActive() == false) {
                em.getTransaction().begin();
            }
            em.getTransaction().rollback();
            mensagem = "Erro ao persistir objeto: " + Util.getMensagemErro(e);
            return false;
        }
    }

    public boolean remover(Convenio obj) {
        try {
            em.getTransaction().begin();
            em.remove(obj);
            em.getTransaction().commit();
            mensagem = "Objeto removido com sucesso!";
            return true;
        } catch (Exception e) {
            if (em.getTransaction().isActive() == false) {
                em.getTransaction().begin();
            }
            em.getTransaction().rollback();
            mensagem = "Erro ao remover objeto: " + Util.getMensagemErro(e);
            return false;
        }
    }

    public Convenio localizar(Integer id){
        return em.find(Convenio.class, id);
    }

    public Convenio getObjetoSelecionado() {
        return objetoSelecionado;
    }

    public void setObjetoSelecionado(Convenio objetoSelecionado) {
        this.objetoSelecionado = objetoSelecionado;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public EntityManager getEm() {
        return em;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }

}
