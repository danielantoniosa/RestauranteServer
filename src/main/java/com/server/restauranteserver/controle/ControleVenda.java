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
import com.server.restauranteserver.persistencia.VendaDAO;
import com.server.restauranteserver.util.Time;
import java.util.ArrayList;

/**
 *
 * @author Daniel
 */
public class ControleVenda {

    public VendaBEAN listarVenda(int mesa) {
        VendaDAO ven = new VendaDAO();
        int venda = ven.getVenda(mesa);
        return ven.listarVenda(venda);
    }

    public String atualizaVenda(VendaBEAN v) {
        VendaDAO ven = new VendaDAO();
        VendaBEAN venda = listarVenda(v.getMesa());
        venda.setCheckOut(v.getCheckOut());
        venda.setPagamento(v.getPagamento());
        venda.setValor(v.getValor());
        ven.atualizaVenda(venda);
        return "sucesso";
    }

    public int abrirMesa(VendaBEAN v) {
        VendaDAO ven = new VendaDAO();
        return ven.abrirMesa(v);
    }

    public String adicionar(PedidoBEAN venda) {
        int mesa = venda.getVenda();
        PedidoDAO p = new PedidoDAO();
        VendaDAO ven = new VendaDAO();
        int v = ven.getVenda(mesa);
        if (v != 0) {
            venda.setVenda(v);
            p.adicionar(venda);
        } else {
            int nvenda = abrirMesa(mesa + "");
            venda.setVenda(nvenda);
            p.adicionar(venda);
        }
        return "sucesso!";
    }

    public ArrayList<ProdutosGravados> getProdutosNImpressos(int parseInt) {
        PedidoDAO p = new PedidoDAO();
        return p.OFFImpressoAll(parseInt);
    }

    public ArrayList<Mesa> getMesasAbertas() {
        VendaDAO ven = new VendaDAO();
        return ven.listarMesasAbertas();
    }

    public float getValorMesa(String mesa) {
        VendaDAO ven = new VendaDAO();
        int venda = getVenda(Integer.parseInt(mesa));
        return ven.getValorMesa(venda);
    }

    public ArrayList<ProdutosGravados> listarProdutosMesa(String text) {
        //verificar se mesa esta aberta
        VendaDAO ven = new VendaDAO();
        PedidoDAO p = new PedidoDAO();
        if (ven.getVenda(Integer.parseInt(text)) != 0) {
            return p.produtosMesa(Integer.parseInt(text));
        } else {
            return null;
        }
    }

    public void transferirMesa(String origem, String destino) {
        VendaDAO ven = new VendaDAO();
        PedidoDAO p = new PedidoDAO();
        int des = getVenda(Integer.parseInt(destino));
        if (des == 0) {
            des = abrirMesa(destino);
        }
        p.transferirMesa(getVenda(Integer.parseInt(origem)), des);
        ven.excluir(getVenda(Integer.parseInt(origem)));
    }

    public int getVenda(int mesa) {
        VendaDAO ven = new VendaDAO();
        return ven.getVenda(mesa);
    }

    private int abrirMesa(String mesa) {
        VendaDAO ven = new VendaDAO();
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
        PedidoDAO p = new PedidoDAO();
        int des = getVenda(mesaDestino);
        if (des == 0) {
            des = abrirMesa(mesaDestino + "");
        }
        p.transferir(getVenda(mesaOrigem), pedido, getVenda(mesaDestino), time);
    }

    public void excluirPedido(int funcionario, String motivo, int pedido) {
        ControleExcluzao e = new ControleExcluzao();
        PedidoDAO p = new PedidoDAO();
        ExcluzaoBEAN pro = new ExcluzaoBEAN();
        pro.setMotivo(motivo);
        pro.setTime(Time.getTime());
        pro.setFuncionario(funcionario);
        p.excluir(pedido, e.inserirExclusao(pro));

    }

    public int gerarMesaBalcao() {
        ControleCaixa cc = new ControleCaixa();
        PedidoDAO p = new PedidoDAO();
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
        ControleCaixa cc = new ControleCaixa();
        VendaDAO ven = new VendaDAO();
        return ven.listarVendasAbertas(cc.getCaixa());
    }

    public float getTotalVendido() {
        ControleCaixa cc = new ControleCaixa();
        VendaDAO ven = new VendaDAO();
        return ven.getTotalVendido(cc.getCaixa());
    }

    public ArrayList<ProdutosGravados> listarProdutosVendidosCaixa() {
        ControleCaixa cc = new ControleCaixa();
        VendaDAO ven = new VendaDAO();
        return ven.listarProdutosVendidosCaixa(cc.getCaixa());
    }

}
