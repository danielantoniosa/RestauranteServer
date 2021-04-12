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

    public int isCaixaAberto(String u, String s) {
        CaixaBEAN caixa = c.listar(u, s);
        return caixa.getCodigo();
    }

    public CaixaBEAN getCaixaAberto(String u, String s) {
        CaixaBEAN caixa = c.listar(u, s);
        return caixa;
    }

    public int getCaixa(String u, String s) {
        return isCaixaAberto(u, s);
    }

    public String abrirCaixa(CaixaBEAN ca, String u, String s) {
        if (isCaixaAberto(u, s) == 0) {
            c.abrirCaixa(ca, u, s);
            return "Abriu!!";
        } else {
            return "Caixa Já Aberto";
        }

    }

    public String fecharCaixa(Float troco, String u, String s) {
        c.fecharCaixa(troco, Time.getTime(), u, s);
        return "Sucesso";
    }

    public CaixaBEAN listar(String u, String s) {
        return c.listar(u, s);
    }

    public String getSaldoAtual(String u, String s) {
        float saldo = c.getSaldoAtual(u, s);
        if (saldo > 0) {
            return saldo + "";
        } else {
            return "-1";
        }

    }

    public String getTotalVendido(String u, String s) {
        float saldo = c.getTotalVendido(u, s);
        return saldo + "";
    }

    public Caixa listarValoresCaixa(String u,String s) {
        /*ControleDespesa d = new ControleDespesa();
        ControleSangria s = new ControleSangria();
        int caixa = getCaixa(empresa);
        Caixa c = new Caixa();
        c.setCaixa(caixa);
        c.setDespesas(d.getTotalDespesasCaixa(empresa));
        c.setSangria(s.getTotalSangriasCaixa(empresa));
        c.setSaldo(Float.parseFloat(getSaldoAtual(empresa)));
        c.setFaturamento(Float.parseFloat(getTotalVendido(empresa)));*/
        return c.getValoresCaixa(u, s);
    }
}
