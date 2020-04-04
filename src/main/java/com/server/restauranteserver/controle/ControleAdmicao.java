/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.controle;

import com.server.restauranteserver.beans.AdmicaoBEAN;
import com.server.restauranteserver.persistencia.AdmicaoDAO;
import com.server.restauranteserver.persistencia.SharedPreferences;
import com.server.restauranteserver.util.Time;

/**
 *
 * @author Daniel
 */
public class ControleAdmicao {

    public String preCadastro(int cod, int empCodigo) {
        AdmicaoDAO a = new AdmicaoDAO();
        a.preAdicionar(cod, empCodigo);
        // enviar email para empresa notificando
        return "Sucesso";
    }

    public AdmicaoBEAN localizar(String funcionario) {
        AdmicaoDAO a = new AdmicaoDAO();
        SharedPreferences s = new SharedPreferences();
        int emp = s.listar();
        return a.localizar(Integer.parseInt(funcionario), emp);
    }

    public String admitir(AdmicaoBEAN ad) {
        AdmicaoDAO a = new AdmicaoDAO();
        a.confirmarAdmicao(ad);
        return "sucesso";
    }

    public String demitir(AdmicaoBEAN ad) {
        AdmicaoDAO a = new AdmicaoDAO();
        a.demitir(ad);
        return "sucesso";
    }

    public String excluir(AdmicaoBEAN ad) {
        AdmicaoDAO a = new AdmicaoDAO();
        a.excluir(ad);
        return "sucesso";
    }

   public void admitir(int codFun, int codEmp) {
       AdmicaoDAO a = new AdmicaoDAO();
       AdmicaoBEAN ad = new AdmicaoBEAN();
       ad.setEmpresa(codEmp);
       ad.setFuncionario(codFun);
       ad.setAdmicao(Time.getData());
       a.admitir(ad);

    }
}
