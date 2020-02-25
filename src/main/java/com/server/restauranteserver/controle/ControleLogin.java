/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.controle;

import com.server.restauranteserver.beans.CargoBEAN;
import com.server.restauranteserver.beans.SharedPreferencesBEAN;
import com.server.restauranteserver.beans.SharedPreferencesEmpresaBEAN;
import com.server.restauranteserver.persistencia.EmpresaDAO;
import java.util.ArrayList;
import javax.swing.DefaultComboBoxModel;
import com.server.restauranteserver.persistencia.FuncionarioDAO;
import com.server.restauranteserver.persistencia.SharedPreferences;

/**
 *
 * @author Daniel
 */
public class ControleLogin {

    public int autenticaUsuario(String email, String senha) {
        SharedPreferences s = new SharedPreferences();
        int emp = s.listar();
        FuncionarioDAO f = new FuncionarioDAO();
        int funcionario = f.Login(email, senha, emp);
        return funcionario;
    }

    public SharedPreferencesEmpresaBEAN autenticaEmpresa(String email, String senha) {
        SharedPreferences s = new SharedPreferences();
        SharedPreferences s2 = new SharedPreferences();
        EmpresaDAO f = new EmpresaDAO();
        SharedPreferencesEmpresaBEAN emp = f.Login(email, senha);
        if (emp.getEmpCodigo() > 0) {
            s.excluir();
            s2.inserir(emp.getEmpCodigo());
        }
        return emp;
    }

    public DefaultComboBoxModel buscar(String produto) {
        FuncionarioDAO f = new FuncionarioDAO();
        DefaultComboBoxModel modelo = new DefaultComboBoxModel();
        ArrayList<String> pe = f.buscar(produto);
        for (String p : pe) {
            modelo.addElement(p);

        }
        return modelo;

    }

    public SharedPreferencesBEAN listarSharedPreferences(int cod) {
        FuncionarioDAO f = new FuncionarioDAO();
        return f.listarSharedPreferences(cod);
    }

}
