/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.controle;

import com.server.restauranteserver.beans.EmpresaBEAN;
import com.server.restauranteserver.persistencia.EmpresaDAO;
import com.server.restauranteserver.util.Time;
import java.text.ParseException;

/**
 *
 * @author Daniel
 */
public class ControleEmpresa {

    public String adicionarEmpresa(EmpresaBEAN e) {
        EmpresaDAO emp = new EmpresaDAO();
        return emp.adcionar(e);
    }

}
