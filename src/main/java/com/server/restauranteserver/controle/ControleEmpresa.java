/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.controle;

import com.server.restauranteserver.beans.EmpresaBEAN;
import com.server.restauranteserver.beans.FuncionarioBEAN;
import com.server.restauranteserver.persistencia.EmpresaDAO;
import com.server.restauranteserver.util.Time;
import java.text.ParseException;

/**
 *
 * @author Daniel
 */
public class ControleEmpresa {

    public String adicionarEmpresa(EmpresaBEAN e) {
        FuncionarioBEAN fun = new FuncionarioBEAN();
        fun.setEmail(e.getEmail());
        fun.setSenha(e.getSenha());
        fun.setLogradouro(e.getLogradouro());
        fun.setBairro(e.getBairro());
        fun.setNumero(e.getNumero());
        fun.setComplemento(e.getComplemento());
        fun.setUf(e.getUf());
        fun.setCep(e.getCep());
        fun.setCidade(e.getCidade());
        EmpresaDAO emp = new EmpresaDAO();
        ControleFuncionario f = new ControleFuncionario();
        int codFun = f.cadastrarADM(fun);
        int codEmp = emp.adcionar(e);
        admitir(codFun, codEmp);

        return "";
    }

    private void admitir(int codFun, int codEmp) {
        ControleAdmicao con = new ControleAdmicao();
        con.admitir(codFun,codEmp);
    }

}
