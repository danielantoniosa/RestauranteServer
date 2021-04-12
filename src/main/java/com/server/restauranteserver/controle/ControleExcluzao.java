/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.controle;

import com.server.restauranteserver.beans.ExcluzaoBEAN;
import com.server.restauranteserver.persistencia.ExcluzaoDAO;
import java.util.ArrayList;

/**
 *
 * @author Daniel
 */
public class ControleExcluzao {

    private ExcluzaoDAO e = new ExcluzaoDAO();

    ControleCaixa caixa = new ControleCaixa();

    public int inserirExclusao(ExcluzaoBEAN pro) {
        return e.inserir(pro);
    }

    public ArrayList<ExcluzaoBEAN> listarExclusaoVenda(String mesa, String u, String s) {
        return e.listarExclusaoMesa(Integer.parseInt(mesa));
    }

    public ExcluzaoBEAN listarUm(String cod) {
        return e.listarUm(cod);
    }

    public ArrayList<ExcluzaoBEAN> listarExclusaoCaixa(String u, String s) {
        return e.listarExclusaoCaixa(u, s);
    }

}
