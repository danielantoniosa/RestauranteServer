/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.servlets;

import com.google.gson.GsonBuilder;
import com.server.restauranteserver.beans.CargoBEAN;
import com.server.restauranteserver.controle.ControleCargo;
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
@WebServlet(name = "EditarCargo", urlPatterns = {"/restaurante_server/EditarCargo"}, initParams = {
    @WebInitParam(name = "cargo", value = ""),
    @WebInitParam(name = "nomeUsuario", value = ""),
    @WebInitParam(name = "senha", value = "")})
public class EditarCargo extends HttpServlet {

    ControleLogin l = new ControleLogin();
    ControleCargo con_cargo = new ControleCargo();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cod = l.autenticaUsuario(request.getParameter("nomeUsuario"), request.getParameter("senha"));
        if (cod > 0) {
            response.setHeader("auth", "1");
            CargoBEAN c = new GsonBuilder().setDateFormat("dd-MM-yyyy HH:mm:ss").create().fromJson(request.getParameter("cargo"), CargoBEAN.class);

            response.setHeader("sucesso", con_cargo.editar(c));

        } else {
            response.setHeader("auth", "0");

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
