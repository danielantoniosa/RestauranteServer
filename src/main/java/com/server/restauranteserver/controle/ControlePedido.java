/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.controle;

import com.server.restauranteserver.beans.Pedido;
import com.server.restauranteserver.beans.ProdutoBEAN;
import com.server.restauranteserver.beans.Produtos;
import com.server.restauranteserver.persistencia.PedidoDAO;
import com.server.restauranteserver.persistencia.ProdutoDAO;
import com.server.restauranteserver.util.Horas;
import java.util.ArrayList;
import javax.swing.DefaultComboBoxModel;

/**
 *
 * @author Daniel
 */
public class ControlePedido {

    private ProdutoDAO p = new ProdutoDAO();

    public DefaultComboBoxModel buscar(String produto) {
        DefaultComboBoxModel modelo = new DefaultComboBoxModel();
        ArrayList<Produtos> pe = p.buscar(produto);
        for (Produtos p : pe) {
            modelo.addElement(p.getCodigo() + " : " + p.getNome() + " : R$ " + p.getPreco());

        }

        return modelo;
    }

    public ArrayList<ProdutoBEAN> listarAll() {
        return p.listarALl();
    }

    public String cadastrar(ProdutoBEAN f) {
        p.adicionar(f);
        return "Cadastro realizado com sucesso!!";
    }

    public String editar(ProdutoBEAN f) {
        p.editar(f);
        return "Pedido editado com sucesso!!";
    }

    public String excluir(int cod) {
        p.excluir(cod);
        return "Exclusão realizado com sucesso!!";
    }

    public ProdutoBEAN localizar(int i) {
        return p.localizar(i);
    }

    public ArrayList<Produtos> listarPedidos(ArrayList<Produtos> pro) {
        ArrayList<Produtos> produtos = p.listarProdutos();
        for (Produtos produto : produtos) {
            pro.add(produto);
        }
        return pro;
    }

    public ArrayList<Pedido> listarPedidos(int emp) {
        ControleCaixa cai = new ControleCaixa();
        PedidoDAO ped = new PedidoDAO();
        int caixa = cai.getCaixa();
        ArrayList<Pedido> pedidos = ped.listarPedidosAbertos(emp, caixa);
        return pedidos;
    }

    public ArrayList<Pedido> alterarPedido(String p, int emp) {
        ControleCaixa cai = new ControleCaixa();
        PedidoDAO ped = new PedidoDAO();
        int caixa = cai.getCaixa();
        ped.mudarStatusRealizado(Integer.parseInt(p));
        ArrayList<Pedido> pedidos = ped.listarPedidosAbertos(emp, caixa);
        return pedidos;
    }

    public ArrayList<Pedido> listarPedidosRealizados(int emp) {
        ControleCaixa cai = new ControleCaixa();
        PedidoDAO ped = new PedidoDAO();
        int caixa = cai.getCaixa();
        ArrayList<Pedido> pedidos = ped.listarPedidosRealizados(emp, caixa);
        return pedidos;
    }

    public ArrayList<Pedido> listarPedidosAtrazados(int emp) {
        ControleCaixa cai = new ControleCaixa();
        PedidoDAO ped = new PedidoDAO();
        int caixa = cai.getCaixa();
        ArrayList<Pedido> pedidos = ped.listarPedidosAtrazados(emp, caixa);
        return pedidos;
    }

    public Produtos buscarUm(String combo) {
        ArrayList<Produtos> todos = p.listarProdutos();
        for (Produtos p : todos) {
            String pro = p.getCodigo() + " : " + p.getNome() + " : R$ " + p.getPreco();
            if (combo.equals(pro)) {
                return p;
            }
        }
        return null;

    }

}
