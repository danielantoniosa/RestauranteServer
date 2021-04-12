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

    //  private ProdutoDAO p = new ProdutoDAO();

    /* public DefaultComboBoxModel buscar(String produto, String u, String s) {
        DefaultComboBoxModel modelo = new DefaultComboBoxModel();
        ArrayList<Produtos> pe = p.buscar(produto, u,s);
        for (Produtos p : pe) {
            modelo.addElement(p.getCodigo() + " : " + p.getNome() + " : R$ " + p.getPreco());
        }
        return modelo;
    }

    public ArrayList<ProdutoBEAN> listarAll(String u, String s) {
        return p.listarALl(u,s);
    }

    public String cadastrar(ProdutoBEAN f, String u, String s) {
        p.adicionar(f, u,s);
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
    }*/

 /*public ArrayList<Produtos> listarPedidos(ArrayList<Produtos> pro, String u, String s) {
        ArrayList<Produtos> produtos = p.listarProdutos(u,s);
        for (Produtos produto : produtos) {
            pro.add(produto);
        }
        return pro;
    }*/
    public ArrayList<Pedido> listarPedidos(String u, String s) {
        PedidoDAO ped = new PedidoDAO();
        ArrayList<Pedido> pedidos = ped.listarPedidosAbertos(u, s);
        return pedidos;
    }

    public ArrayList<Pedido> listarPedidosCaixa(String u, String s) {
        PedidoDAO ped = new PedidoDAO();
        ArrayList<Pedido> pedidos = ped.listarPedidos(u, s);
        return pedidos;
    }

    public ArrayList<Pedido> alterarPedido(String p, String u, String s) {
        PedidoDAO ped = new PedidoDAO();
        ped.mudarStatusRealizado(Integer.parseInt(p), Horas.getTime());
        return listarPedidos(u, s);
    }

    public ArrayList<Pedido> listarPedidosRealizados(String u, String s) {
        PedidoDAO ped = new PedidoDAO();
        ArrayList<Pedido> pedidos = ped.listarPedidosRealizados(u, s);
        return pedidos;
    }

    public ArrayList<Pedido> listarPedidosAtrazados(String u, String s) {
        PedidoDAO ped = new PedidoDAO();
        ArrayList<Pedido> pedidos = ped.listarPedidosAtrazados(u, s);
        return pedidos;
    }

    /* public Produtos buscarUm(String combo, String u, String s) {
        ArrayList<Produtos> todos = p.listarProdutos(u, s);
        for (Produtos p : todos) {
            String pro = p.getCodigo() + " : " + p.getNome() + " : R$ " + p.getPreco();
            if (combo.equals(pro)) {
                return p;
            }
        }
        return null;

    }*/
}
