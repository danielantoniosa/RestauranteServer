/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.controle;

import com.server.restauranteserver.beans.CargoBEAN;
import com.server.restauranteserver.beans.SharedPreferencesBEAN;
import java.util.ArrayList;
import javax.swing.DefaultComboBoxModel;
import com.server.restauranteserver.persistencia.FuncionarioDAO;


/**
 *
 * @author Daniel
 */
public class ControleLogin {

    private FuncionarioDAO f = new FuncionarioDAO();

    public int autenticaUsuario (String email, String senha) {
        int funcionario = f.Login(email, senha);
        return funcionario;
    }

    public DefaultComboBoxModel buscar(String produto) {
        DefaultComboBoxModel modelo = new DefaultComboBoxModel();
        ArrayList<String> pe = f.buscar(produto);
        for (String p : pe) {
            modelo.addElement(p);

        }
        return modelo;

    }

    public SharedPreferencesBEAN listarSharedPreferences(int cod) {
        return f.listarSharedPreferences(cod);
    }

   

}
