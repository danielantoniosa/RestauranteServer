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

    public int isCaixaAberto() {
        int cc = SharedPreferencesControl.listarEmpresa();
        CaixaBEAN caixa = c.listar(cc);
        return caixa.getCodigo();
    }

    public int getCaixa() {
        return isCaixaAberto();
    }

    public String abrirCaixa(CaixaBEAN ca) {
        int caixa = SharedPreferencesControl.listarEmpresa();
        ca.setEmpresa(caixa);
        if (isCaixaAberto() == 0) {
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
        int caixa = SharedPreferencesControl.listarEmpresa();
        return c.listar(caixa);
    }

    public String getSaldoAtual() {
        int emp = SharedPreferencesControl.listarEmpresa();
        int caixa = getCaixa();
        if (caixa > 0) {
            float saldo = c.getSaldoAtual(caixa, emp);
            return saldo + "";
        } else {
            return "-1";
        }

    }

    public String getTotalVendido() {
        int caixa = SharedPreferencesControl.listarEmpresa();

        float saldo = c.getTotalVendido(getCaixa(), caixa);
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
