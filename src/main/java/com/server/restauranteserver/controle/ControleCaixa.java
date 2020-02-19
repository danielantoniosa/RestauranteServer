/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.controle;

import com.server.restauranteserver.beans.Caixa;
import com.server.restauranteserver.beans.CaixaBEAN;
import com.server.restauranteserver.persistencia.CaixaDAO;

import com.server.restauranteserver.util.Time;

/**
 *
 * @author Daniel
 */
public class ControleCaixa {

    private final CaixaDAO c = new CaixaDAO();
    //

    public String isCaixaAberto() {
        CaixaBEAN caixa = c.listar();
        if (caixa.getCodigo() != 0) {
            return "true";
        } else {
            return "false";
        }
    }

    public int getCaixa() {
        if (isCaixaAberto().equals("true")) {
            CaixaBEAN ca = this.listar();
            return ca.getCodigo();
        } else {
            return 0;
        }
    }

    public String abrirCaixa(CaixaBEAN ca) {
        if (isCaixaAberto().equals("false")) {
            c.abrirCaixa(ca);
            return "Abriu!!";
        } else {
            return "Caixa Já Aberto";
        }

    }

    public String fecharCaixa(String troco) {
        CaixaBEAN ca = new CaixaBEAN();
        ca.setCodigo(getCaixa());
        ca.setOut(Time.getTime());
        ca.setTrocoFin(Float.parseFloat(troco));
        c.fecharCaixa(ca);
        return "Sucesso";
    }

    public CaixaBEAN listar() {
        return c.listar();
    }

    public String getSaldoAtual() {
        if (isCaixaAberto().equals("true")) {
            float saldo = c.getSaldoAtual(getCaixa());
            return saldo + "";
        } else {
            return "-1";
        }

    }

    public String getTotalVendido() {
        float saldo = c.getTotalVendido(getCaixa());
        return saldo + "";
    }

    public Caixa listarValoresCaixa() {
        ControleDespesa d = new ControleDespesa();
        ControleSangria s = new ControleSangria();
        Caixa c = new Caixa();
        c.setDespesas(d.getTotalDespesasCaixa());
        c.setSangria(s.getTotalSangriasCaixa());
        c.setSaldo(Float.parseFloat(getSaldoAtual()));
        c.setFaturamento(Float.parseFloat(getTotalVendido()));
        return c;
    }
}
