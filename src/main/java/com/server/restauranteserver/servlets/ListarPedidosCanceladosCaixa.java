/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.servlets;

import com.google.gson.Gson;
import com.server.restauranteserver.beans.ExcluzaoBEAN;
import com.server.restauranteserver.controle.ControleExcluzao;
import com.server.restauranteserver.controle.ControleLogin;
import java.io.IOException;
import java.util.ArrayList;
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
@WebServlet(name = "ListarExcluzaoCaixa", urlPatterns = {"/restaurante_server/ListarExcluzaoCaixa"}, initParams = {
    @WebInitParam(name = "nomeUsuario", value = ""),
    @WebInitParam(name = "senha", value = "")})
public class ListarPedidosCanceladosCaixa extends HttpServlet {

    ControleLogin l = new ControleLogin();
    ControleExcluzao pro = new ControleExcluzao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String n = new String(request.getParameter("nomeUsuario").getBytes("iso-8859-1"), "UTF-8");
        String s = new String(request.getParameter("senha").getBytes("iso-8859-1"), "UTF-8");

        ArrayList<ExcluzaoBEAN> u = pro.listarExclusaoCaixa(n, s);
        response.setHeader("auth", "1");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(new Gson().toJson(u));
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
