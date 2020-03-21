/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.controle;

import com.server.restauranteserver.persistencia.SharedPreferences;

/**
 *
 * @author Daniel
 */
public class SharedPreferencesControl {
    public static int listarEmpresa() {
        SharedPreferences s = new SharedPreferences();
        return s.listar();
    }

}
