/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.controle;

import com.server.restauranteserver.beans.FuncionarioBEAN;
import java.util.ArrayList;
import com.server.restauranteserver.persistencia.FuncionarioDAO;


/**
 *
 * @author Daniel
 */
public class FuncionarioControle {

    private FuncionarioDAO f = new FuncionarioDAO();

    public int funCargo(int cod) {
        return f.funCargo(cod);
    }

    public String cadastrar(FuncionarioBEAN fu) {
        if (f.isExiste(fu.getEmail()) == false) {
            f.adicionar(fu);
            return "Cadastro Realizado com SUCESSO!!";
        } else {
            return "Funcionario com email" + fu.getEmail() + " já CADASTRADO!!";
        }
    }

    public int gerarNumeroPonto() {
        int valor = 0;
        boolean para = true;
        while (para) {
            valor = (int) (Math.random() * 1000000000);
            if (!f.numeroCartaoExistente(valor)) {
                para = false;
            }
        }
        return valor;
    }

    public ArrayList<FuncionarioBEAN> listarAll() {
        ArrayList<FuncionarioBEAN> retorno = f.listarALl();
        return retorno;

    }

    public int localizar(int parseInt) {
        return f.localizar(parseInt).getCodigo();
    }

    public void excluir(int codExcluir) {
        f.excluir(codExcluir);
    }

    public FuncionarioBEAN listarUm(int cod) {
        return f.localizar(cod);
    }

}
