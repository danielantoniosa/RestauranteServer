/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.controle;

import com.server.restauranteserver.beans.ExcluzaoBEAN;
import com.server.restauranteserver.beans.Mesa;
import com.server.restauranteserver.beans.PedidoBEAN;
import com.server.restauranteserver.beans.ProdutosGravados;
import com.server.restauranteserver.beans.VendaBEAN;
import com.server.restauranteserver.persistencia.PedidoDAO;
import com.server.restauranteserver.persistencia.ProdutoDAO;
import com.server.restauranteserver.persistencia.VendaDAO;
import com.server.restauranteserver.util.Time;
import java.util.ArrayList;

/**
 *
 * @author Daniel
 */
public class ControleVenda {

    //private VendaAtualDAO v = new VendaAtualDAO();
    private VendaDAO ven = new VendaDAO();
    private PedidoDAO p = new PedidoDAO();
    private ControleExcluzao e = new ControleExcluzao();
    private ProdutoDAO ped = new ProdutoDAO();
    private ControleCaixa cc = new ControleCaixa();

    public VendaBEAN listarVenda(int mesa) {
        return ven.listarVenda(getVenda(mesa));
    }

    public String atualizaVenda(VendaBEAN v) {
        VendaBEAN venda = listarVenda(v.getMesa());
        venda.setCheckOut(v.getCheckOut());      
        venda.setPagamento(v.getPagamento());
        venda.setValor(v.getValor());
        ven.atualizaVenda(venda);
        return "sucesso";
    }

    public int abrirMesa(VendaBEAN v) {
        return ven.abrirMesa(v);
    }

    public void adicionar(PedidoBEAN venda) {
        p.adicionar(venda);
    }

    public ArrayList<ProdutosGravados> getProdutosNImpressos(int parseInt) {
        return p.OFFImpressoAll(parseInt);
    }

    public ArrayList<Mesa> getMesasAbertas() {
        return ven.listarMesasAbertas();
    }

    public float getValorMesa(String mesa) {
        int venda = getVenda(Integer.parseInt(mesa));
        return ven.getValorMesa(venda);
    }

    public ArrayList<ProdutosGravados> listarProdutosMesa(String text) {
        //verificar se mesa esta aberta
        if (ven.getVenda(Integer.parseInt(text)) != 0) {
            return p.produtosMesa(Integer.parseInt(text));
        } else {
            return null;
        }
    }

    public void transferirMesa(String origem, String destino) {
        int des = getVenda(Integer.parseInt(destino));
        if (des == 0) {
            des = abrirMesa(destino);
        }
        p.transferirMesa(getVenda(Integer.parseInt(origem)), des);
        ven.excluir(getVenda(Integer.parseInt(origem)));
    }

    public int getVenda(int mesa) {
        return ven.getVenda(mesa);
    }

    private int abrirMesa(String mesa) {
        ControleCaixa ca = new ControleCaixa();
        VendaBEAN v = new VendaBEAN();
        v.setCaixa(ca.getCaixa());
        v.setCheckIn(getHoraAtual());
        v.setMesa(Integer.parseInt(mesa));
        return ven.abrirMesa(v);
    }

    private String getHoraAtual() {
        return Time.getTime();
    }

    public void transferirProduto(int mesaOrigem, int mesaDestino, int pedido, String time) {
        int des = getVenda(mesaDestino);
        if (des == 0) {
            des = abrirMesa(mesaDestino + "");
        }
        p.transferir(getVenda(mesaOrigem), pedido, getVenda(mesaDestino), time);
    }

    public void excluirPedido(int funcionario, String motivo, int pedido) {
        ExcluzaoBEAN pro = new ExcluzaoBEAN();
        pro.setMotivo(motivo);
        pro.setTime(Time.getTime());
        pro.setFuncionario(funcionario);
        p.excluir(pedido, e.inserirExclusao(pro));
        ;
    }

    public int gerarMesaBalcao() {

        int mesa = p.getMesaBalcaoAberta(cc.getCaixa());
        if (mesa > 0) {
            return mesa;
        } else {
            mesa = p.getMaxMesa(cc.getCaixa());
            if (mesa > 100) {
                return ++mesa;
            } else {
                return 101;
            }
        }
    }

    public ArrayList<VendaBEAN> listarVendasAbertas() {
        return ven.listarVendasAbertas(cc.getCaixa());
    }

    public float getTotalVendido() {
        return ven.getTotalVendido(cc.getCaixa());
    }

    public ArrayList<ProdutosGravados> listarProdutosVendidosCaixa() {
        return ven.listarProdutosVendidosCaixa(cc.getCaixa());
    }

}
