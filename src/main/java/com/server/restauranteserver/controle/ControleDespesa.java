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
    private DespesaDAO d = new DespesaDAO();
    private ControleCaixa c = new ControleCaixa();

    public ArrayList<DespesaBEAN> listarALL() {
        ArrayList<DespesaBEAN> t = d.listarAll();
        return t;
    }

    public String adicionar(DespesaBEAN despesa) {
        d.adicionar(despesa);
        return "Cadastro Realizado com SUCESSO!!";
    }

    public String excluir(ArrayList<DespesaBEAN> des) {
        for (DespesaBEAN d : des) {
            this.d.excluir(d.getCodigo());
        }
        return "Excluzão realizada com SUCESSO!!";
    }

    public String adicionarDespesaDia(ArrayList<DespesaBEAN> dadosIncluir) {
        for (DespesaBEAN d : dadosIncluir) {
            this.d.adicionarDespesaDia(d, c.getCaixa());
        }
        return "Cadastro Realizado com SUCESSO!!";

    }

    public String retirarDespesaDia(ArrayList<DespesaBEAN> dadosIncluir) {
        for (DespesaBEAN d : dadosIncluir) {
            this.d.retirarDespesa(c.getCaixa(), d.getCodigo());
        }
        return "SUCESSO!!";

    }

    public ArrayList<DespesaBEAN> listarDespesaDia() {
        return d.listarDespesaCaixa(c.getCaixa());
    }

    public Float getTotalDespesasCaixa() {
        return d.getTotalDespesasCaixa(c.getCaixa());
    }

}
