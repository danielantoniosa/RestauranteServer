/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.controle;

import com.server.restauranteserver.beans.ProdutoBEAN;
import com.server.restauranteserver.beans.Produtos;
import com.server.restauranteserver.persistencia.ProdutoDAO;
import java.util.ArrayList;
import javax.swing.DefaultComboBoxModel;

/**
 *
 * @author Daniel
 */
public class ControleProduto {

    private ProdutoDAO p = new ProdutoDAO();
    private ControlePedido pc = new ControlePedido();

    public DefaultComboBoxModel buscar(String produto, String u, String s) {
        DefaultComboBoxModel modelo = new DefaultComboBoxModel();

        ArrayList<Produtos> pp = p.buscar(produto, u, s);
        if (pp.size() > 0) {
            for (Produtos p : pp) {
                modelo.addElement(p.getCodigo() + " : " + p.getNome() + " : R$ " + p.getPreco());

            }
        } else {
            System.out.println("Retorno vasio");
        }
        return modelo;
    }

    public ArrayList<Produtos> buscarP(String produto, String u, String s) {
        ArrayList<Produtos> pp = p.buscar(produto, u, s);
        return pp;
    }

    public ProdutoBEAN localizar(String produto) {
        return p.localizar(Integer.parseInt(produto));
    }

    public ArrayList<ProdutoBEAN> listarAll(String u, String s) {
        return p.listarALl(u, s);
    }

    public String cadastrar(ProdutoBEAN f, String u, String s) {
        ProdutoBEAN pro = p.localizar(f.getNome(), u, s);
        if (pro.getCodigo() == 0) {
            p.adicionar(f, u, s);

            return "Cadastro Realizado com sucesso!!";
        } else {
            return "Produto com o mesmo nome já CADASTRADO!!";
        }
    }

    public String editar(ProdutoBEAN f) {
        p.editar(f);
        return "Produto editado com sucesso!!";
    }

    public String excluir(String cod) {
        p.excluir(Integer.parseInt(cod));

        return "Produto Excluido com sucesso!!";
    }

    public Produtos buscarUm(String combo, String u, String s) {
        ArrayList<Produtos> produtos = p.listarProdutos(u, s);
        //  ArrayList<Produtos> todos = pc.listarPedidos(produtos);
        for (Produtos p : produtos) {
            String pro = p.getCodigo() + " : " + p.getNome() + " : R$ " + p.getPreco();
            if (combo.equals(pro)) {
                return p;
            }
        }
        return null;
    }

    public float quantidadeEstoque(int produto, float quantidade) {
        float qtd = p.quantidadeEstoque(produto);
        return qtd;
    }

    public void diminuiEstoque(int produto, float diminuicao, float atual) {
        p.alteraQuantidade(produto, (atual - diminuicao));
    }
    public void aumentaEstoque(int produto, float quantidade) {
        System.out.println(" quantidade : " + quantidade);
        float qtd = p.quantidadeEstoque(produto);
        System.out.println(" qtd : " + qtd);
        qtd += quantidade;
        System.out.println(" qtd : " + qtd);
        p.alteraQuantidade(produto, qtd);

    }

}
