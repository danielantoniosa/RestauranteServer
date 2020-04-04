/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.controle;

import com.google.zxing.WriterException;
import com.server.restauranteserver.beans.ExcluzaoBEAN;
import com.server.restauranteserver.beans.Mesa;
import com.server.restauranteserver.beans.PedidoBEAN;
import com.server.restauranteserver.beans.ProdutosGravados;
import com.server.restauranteserver.beans.VendaBEAN;
import com.server.restauranteserver.persistencia.PedidoDAO;
import com.server.restauranteserver.persistencia.VendaDAO;
import com.server.restauranteserver.util.QRCode;
import com.server.restauranteserver.util.Time;
import com.server.restauranteserver.util.Util;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author Daniel
 */
public class ControleVenda {

    public VendaBEAN listarVenda(int mesa) {
        VendaDAO ven = new VendaDAO();
        ControleCaixa cc = new ControleCaixa();
        int venda = ven.getVenda(mesa, cc.getCaixa());
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
        ControleCaixa cc = new ControleCaixa();
        v.setCaixa(cc.getCaixa());
        return ven.abrirMesa(v);
    }

    public int adicionar(PedidoBEAN venda) throws WriterException, IOException {
        int pedido = 0;
        int mesa = venda.getVenda();
        ControleCaixa cc = new ControleCaixa();
        int caixa = cc.getCaixa();
        System.out.println("caixa " + caixa);
        PedidoDAO p = new PedidoDAO();
        VendaDAO ven = new VendaDAO();
        int v = ven.getVenda(mesa, caixa);
        if (v != 0) {
            venda.setVenda(v);
            pedido = p.adicionar(venda);
        } else {
            int nvenda = abrirMesa(mesa + "", caixa);
            venda.setVenda(nvenda);
            pedido = p.adicionar(venda);
        }
        return pedido;
    }

    public ArrayList<Mesa> getMesasAbertas() {
        VendaDAO ven = new VendaDAO();
        ControleCaixa cc = new ControleCaixa();
        return ven.listarMesasAbertas(cc.getCaixa());
    }

    public ArrayList<Mesa> getMesaAberta() {
        VendaDAO ven = new VendaDAO();
        ControleCaixa cc = new ControleCaixa();
        int caixa = cc.getCaixa();
        if (caixa > 0) {
            return ven.listarMesaAberta(cc.getCaixa());
        } else {
            return null;
        }
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
        ControleCaixa cc = new ControleCaixa();
        if (ven.getVenda(Integer.parseInt(text), cc.getCaixa()) != 0) {
            return p.produtosMesa(Integer.parseInt(text));
        } else {
            return null;
        }
    }

    public String transferirMesa(String origem, String destino) throws WriterException, IOException {
        VendaDAO ven = new VendaDAO();
        PedidoDAO p = new PedidoDAO();
        ControleCaixa ca = new ControleCaixa();
        int caixa = ca.getCaixa();
        int des = getVenda(Integer.parseInt(destino));
        if (des == 0) {
            des = abrirMesa(destino, caixa);
        }
        p.transferirMesa(getVenda(Integer.parseInt(origem)), des);
        ven.excluir(getVenda(Integer.parseInt(origem)));
        return "sucesso!";
    }

    public int getVenda(int mesa) {
        VendaDAO ven = new VendaDAO();
        ControleCaixa cc = new ControleCaixa();
        return ven.getVenda(mesa, cc.getCaixa());
    }

    private int abrirMesa(String mesa, int caixa) throws WriterException, IOException {
        VendaDAO ven = new VendaDAO();
        VendaBEAN v = new VendaBEAN();
        v.setCaixa(caixa);
        v.setCheckIn(getHoraAtual());
        v.setMesa(Integer.parseInt(mesa));
        int venda = ven.abrirMesa(v);
        byte[] qr = QRCode.getQRCodeImage(mesa, 350, 350);
        ven.inserirQRCode(qr, venda);
        return venda;
    }

    public int abrirMesa(String mesa) throws WriterException, IOException {
        ControleCaixa cc = new ControleCaixa();
        VendaDAO ven = new VendaDAO();
        VendaBEAN v = new VendaBEAN();
        int caixa = cc.getCaixa();
        if (caixa > 0) {
            v.setCaixa(cc.getCaixa());
            v.setCheckIn(getHoraAtual());
            v.setMesa(Integer.parseInt(mesa));
            int venda = ven.getVenda(v.getMesa(), v.getCaixa());
            if (venda == 0) {
                int vend = ven.abrirMesa(v);
                System.out.println("Mesa : " + mesa);
                byte[] qr = QRCode.getQRCodeImage(v.getMesa() + "", 350, 350);
                ven.inserirQRCode(qr, vend);
                return vend;
            } else {
                return 0;
            }
        } else {
            return -1;
        }

    }

    private String getHoraAtual() {
        return Time.getTime();
    }

    public String transferirPedido(String mesaDestino, String pedido) throws WriterException, IOException {
        PedidoDAO p = new PedidoDAO();
        ControleCaixa ca = new ControleCaixa();
        int caixa = ca.getCaixa();
        int destino = Integer.parseInt(mesaDestino);
        int pedi = Integer.parseInt(pedido);
        int des = getVenda(destino);
        if (des == 0) {
            des = abrirMesa(mesaDestino, caixa);
        }
        p.transferir(pedi, getVenda(destino));
        return "Sucesso";
    }

    public String excluirPedido(int funcionario, String motivo, String pedido) {
        ControleExcluzao e = new ControleExcluzao();
        PedidoDAO p = new PedidoDAO();
        ExcluzaoBEAN pro = new ExcluzaoBEAN();
        pro.setMotivo(motivo);
        pro.setTime(Time.getTime());
        pro.setFuncionario(funcionario);

        int ex = e.inserirExclusao(pro);
        p.excluir(Integer.parseInt(pedido), ex);
        return "sucesso!";

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

    public String isMesasAbertas() {
        ControleCaixa cc = new ControleCaixa();
        VendaDAO ven = new VendaDAO();
        return ven.isVendasAbertas(cc.getCaixa());
    }

    public void adicionar(ArrayList<PedidoBEAN> venda) throws WriterException, IOException {
        int mesa = venda.get(0).getVenda();
        ControleCaixa cc = new ControleCaixa();
        int caixa = cc.getCaixa();
        System.out.println("caixa " + caixa);
        PedidoDAO p = new PedidoDAO();
        VendaDAO ven = new VendaDAO();
        int v = ven.getVenda(mesa, caixa);
        if (v != 0) {
            for (PedidoBEAN pedido : venda) {
                pedido.setVenda(v);
                p.adicionar(pedido);
            }
        } else {
            int nvenda = abrirMesa(mesa + "", caixa);
            for (PedidoBEAN pedido : venda) {
                pedido.setVenda(nvenda);
                p.adicionar(pedido);
            }
        }
    }

}
