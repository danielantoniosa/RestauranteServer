/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.controle;

import com.server.restauranteserver.beans.SangriaBEAN;
import com.server.restauranteserver.persistencia.SangriaDAO;
import java.util.ArrayList;

/**
 *
 * @author Daniel
 */
public class ControleSangria {

    private SangriaDAO s = new SangriaDAO();
    private ControleCaixa c = new ControleCaixa();

    public String cadastrar(SangriaBEAN sangria) {
        sangria.setCaixa(c.getCaixa());
        s.adicionar(sangria);
        return "Sucesso!";
    }

    public ArrayList<SangriaBEAN> listarSangriasCaixa() {
        return s.buscar(c.getCaixa());
    }

    public float getTotalSangriasCaixa() {
        return s.getTotalSangriasCaixa(c.getCaixa());
    }

}
