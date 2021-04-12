/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.controle;

import com.server.restauranteserver.beans.DespesaBEAN;
import com.server.restauranteserver.persistencia.DespesaDAO;
import java.util.ArrayList;


/**
 *
 * @author Daniel
 */
public class ControleDespesa {
   final private DespesaDAO d = new DespesaDAO();

    public ArrayList<DespesaBEAN> listarALL(String u,String s) {        
        ArrayList<DespesaBEAN> t = d.listarAll(u,s);
        return t;
    }

    public String adicionar(DespesaBEAN despesa, String u,String s) {
        d.adicionar(despesa,u,s);
        return "Cadastro Realizado com SUCESSO!!";
    }

    public String excluir(ArrayList<DespesaBEAN> des) {
        for (DespesaBEAN d : des) {
            this.d.excluir(d.getCodigo());
        }
        return "Excluzão realizada com SUCESSO!!";
    }

    public Float getTotalDespesasCaixa(String u,String s) {
        return d.getTotalDespesasCaixa(u,s);
    }

}
