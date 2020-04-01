/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.servlets;

import com.google.gson.GsonBuilder;
import com.google.zxing.WriterException;
import com.server.restauranteserver.beans.CaixaBEAN;
import com.server.restauranteserver.beans.PedidoBEAN;
import com.server.restauranteserver.beans.SangriaBEAN;
import com.server.restauranteserver.controle.ControleCaixa;
import com.server.restauranteserver.controle.ControleLogin;
import com.server.restauranteserver.controle.ControleSangria;
import com.server.restauranteserver.controle.ControleVenda;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "InserirPedidoMesa", urlPatterns = {"/restaurante_server/InserirPedidoMesa"}, initParams = {
    @WebInitParam(name = "pedido", value = ""),
    @WebInitParam(name = "nomeUsuario", value = ""),
    @WebInitParam(name = "senha", value = "")})
public class InserirPedidoMesa extends HttpServlet {

    ControleLogin l = new ControleLogin();
    ControleVenda con = new ControleVenda();

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
            PedidoBEAN c = new GsonBuilder().setDateFormat("dd-MM-yyyy HH:mm:ss").create().fromJson(request.getParameter("pedido"), PedidoBEAN.class);
            try {
                response.setHeader("sucesso", con.adicionar(c));
            } catch (WriterException ex) {
                Logger.getLogger(InserirPedidoMesa.class.getName()).log(Level.SEVERE, null, ex);
            }

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
