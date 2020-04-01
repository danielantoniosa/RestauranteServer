/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.controle;

import com.server.restauranteserver.beans.CargoBEAN;
import com.server.restauranteserver.beans.FuncionarioBEAN;
import java.util.ArrayList;
import com.server.restauranteserver.persistencia.FuncionarioDAO;
import com.server.restauranteserver.persistencia.SharedPreferences;
import com.server.restauranteserver.util.GerarNumeros;

/**
 *
 * @author Daniel
 */
public class ControleFuncionario {

    private FuncionarioDAO f = new FuncionarioDAO();

    public int funCargo(int cod) {
        return f.funCargo(cod);
    }

    public int cadastrar(FuncionarioBEAN fu) {
        if (f.isExiste(fu.getEmail()) == false) {
            return f.adicionar(fu);
        } else {
            return 0;
        }
    }

    public int gerarNumeroPonto() {
        System.out.println("passou");
        boolean para = false;
        int valor = GerarNumeros.geraNumeroInterio(10);
        while (para) {
            if (f.numeroCartaoExistente(valor) == false) {
                System.out.println("true" + " : " + valor);
                para = true;
                return valor;
            }
        }
        System.out.println("passou");
        return valor;
    }

    public boolean numeroCartaoExistente(int valor) {
        return f.numeroCartaoExistente(valor);
    }

    public ArrayList<FuncionarioBEAN> listarAll() {
        SharedPreferences s = new SharedPreferences();
        int emp = s.listar();
        ArrayList<FuncionarioBEAN> retorno = f.listarALl(emp);
        return retorno;

    }

    public int localizar(int parseInt) {
        return f.localizar(parseInt).getCodigo();
    }

    public void excluir(int codExcluir) {
        f.excluir(codExcluir);
    }

    public FuncionarioBEAN listarUm(String cod) {
        return f.localizar(Integer.parseInt(cod));
    }
    public FuncionarioBEAN listarUm(int cod) {
        return f.localizar(cod);
    }

}
