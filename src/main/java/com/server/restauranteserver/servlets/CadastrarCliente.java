/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.servlets;

import com.google.gson.GsonBuilder;
import com.server.restauranteserver.beans.CargoBEAN;
import com.server.restauranteserver.beans.ClienteBEAN;
import com.server.restauranteserver.beans.EnderecoBEAN;
import com.server.restauranteserver.beans.FuncionarioBEAN;
import com.server.restauranteserver.beans.SharedPreferencesEmpresaBEAN;
import com.server.restauranteserver.controle.ControleAdmicao;
import com.server.restauranteserver.controle.ControleCargo;
import com.server.restauranteserver.controle.ControleCliente;
import com.server.restauranteserver.controle.ControleFuncionario;
import com.server.restauranteserver.controle.ControleLogin;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Daniel
 */
@WebServlet(name = "AdicionarCliente", urlPatterns = {"/restaurante_server/AdicionarCliente"}, initParams = {
    @WebInitParam(name = "cliente", value = ""),
    @WebInitParam(name = "endereco", value = "")
})
public class CadastrarCliente extends HttpServlet {

    ControleCliente con = new ControleCliente();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String str = new String(request.getParameter("cliente").getBytes("iso-8859-1"), "UTF-8");
        String end = new String(request.getParameter("endereco").getBytes("iso-8859-1"), "UTF-8");
        ClienteBEAN c = new GsonBuilder().setDateFormat("dd-MM-yyyy HH:mm:ss").create().fromJson(str, ClienteBEAN.class);
        EnderecoBEAN e = new GsonBuilder().setDateFormat("dd-MM-yyyy HH:mm:ss").create().fromJson(end, EnderecoBEAN.class);
        int cod = con.adicionar(c,e);
        if (cod == 0) {
            response.setHeader("sucesso", "Cliente CADASTRADO COM SECESSO!!");
        } else {
            response.setHeader("sucesso", "CLIENTE COM ESTE EMAIL já ESTA CADASTRADO!!");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
