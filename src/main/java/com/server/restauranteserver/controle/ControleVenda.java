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
import com.server.restauranteserver.beans.Venda;
import com.server.restauranteserver.beans.VendaBEAN;
import com.server.restauranteserver.persistencia.PedidoDAO;
import com.server.restauranteserver.persistencia.ProdutoDAO;
import com.server.restauranteserver.persistencia.VendaDAO;
import com.server.restauranteserver.util.QRCode;
import com.server.restauranteserver.util.Time;
import com.server.restauranteserver.util.Util;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

/**
 *
 * @author Daniel
 */
public class ControleVenda {

    public VendaBEAN listarVenda(int mesa, int emp) {
        VendaDAO ven = new VendaDAO();
        ControleCaixa cc = new ControleCaixa();
        int venda = ven.getVenda(mesa, cc.getCaixa(emp));
        return ven.listarVenda(venda);
    }

    public String atualizaVenda(VendaBEAN v, int emp) {
        VendaDAO ven = new VendaDAO();
        VendaBEAN venda = listarVenda(v.getMesa(), emp);
        venda.setCheckOut(v.getCheckOut());
        venda.setPagamento(v.getPagamento());
        venda.setValor(v.getValor());
        venda.setDesconto(v.getDesconto());
        ven.atualizaVenda(venda);
        return "sucesso";
    }

    public File atualizaVendaNota(VendaBEAN v, int emp, ServletContext contexto) {
        ControleRelatorio r = new ControleRelatorio();
        VendaDAO ven = new VendaDAO();
        float des = v.getDesconto();
        VendaBEAN venda = listarVenda(v.getMesa(), emp);
        venda.setCheckOut(v.getCheckOut());
        venda.setPagamento(v.getPagamento());
        venda.setValor(v.getValor());
        int cod = venda.getCodigo();
        venda.setDesconto(des);
        ven.atualizaVenda(venda);
        System.out.println(cod);
        return r.geraRelatorioVenda(contexto, emp, cod);
    }

    public int abrirMesa(VendaBEAN v, int emp) {
        VendaDAO ven = new VendaDAO();
        ControleCaixa cc = new ControleCaixa();
        v.setCaixa(cc.getCaixa(emp));
        return ven.abrirMesa(v);
    }

    public int adicionar(PedidoBEAN venda, int emp) {
        int pedido = 0;
        //verificar se contem produto em estoque para produtos diferentes do tipo de cozinha
        ControleProduto cp = new ControleProduto();
        float qtd = cp.quantidadeEstoque(venda.getProduto(), emp, venda.getQuantidade());
        //retorn -1 referece produto do tipo Cozinha
        System.out.println("quantidade :" + qtd);
        if (qtd == -1) {
            System.out.println("Cozinha");
            int mesa = venda.getVenda();
            ControleCaixa cc = new ControleCaixa();
            int caixa = cc.getCaixa(emp);
            System.out.println("caixa " + caixa);
            PedidoDAO p = new PedidoDAO();
            VendaDAO ven = new VendaDAO();
            int v = ven.getVenda(mesa, caixa);
            if (v != 0) {
                venda.setVenda(v);
                venda.setStatus("Pendente");
                pedido = p.adicionar(venda);
            } else {
                int nvenda = abrirMesa(mesa + "", caixa);
                venda.setVenda(nvenda);
                venda.setStatus("Pendente");
                pedido = p.adicionar(venda);
            }
            return pedido;
        } else if (qtd >= venda.getQuantidade()) {
            System.out.println("Balcao");
            cp.diminuiEstoque(venda.getProduto(), venda.getQuantidade(), qtd);
            venda.setStatus("Realizado");
            return adiciona(venda, emp);
        } else {
            return -1;
        }
    }

    public String adicionar(ArrayList<PedidoBEAN> venda, int emp) throws WriterException, IOException {
        String ret = "Sucesso";
        int mesa = venda.get(0).getVenda();
        ControleCaixa cc = new ControleCaixa();
        int caixa = cc.getCaixa(emp);
        System.out.println("caixa " + caixa);
        PedidoDAO p = new PedidoDAO();
        VendaDAO ven = new VendaDAO();
        int v = ven.getVenda(mesa, caixa);
        if (v != 0) {
            for (PedidoBEAN pedido : venda) {
                //verificar se contem produto em estoque para produtos diferentes do tipo de cozinha
                ControleProduto cp = new ControleProduto();
                float qtd = cp.quantidadeEstoque(pedido.getProduto(), emp, pedido.getQuantidade());
                //retorn -1 referece produto do tipo Cozinha
                if (qtd == -1) {
                    pedido.setVenda(v);
                    pedido.setStatus("Pendente");
                    p.adicionar(pedido);
                } else if (qtd >= pedido.getQuantidade()) {
                    System.out.println("Balcao");
                    cp.diminuiEstoque(pedido.getProduto(), pedido.getQuantidade(), qtd);
                    pedido.setStatus("Realizado");
                    adiciona(pedido, emp);

                } else {
                    ret += " , produto : " + pedido.getProduto() + ",";
                }
            }
        } else {
            int nvenda = abrirMesaM(mesa + "", emp);
            for (PedidoBEAN pedido : venda) {
                //verificar se contem produto em estoque para produtos diferentes do tipo de cozinha
                ControleProduto cp = new ControleProduto();
                float qtd = cp.quantidadeEstoque(pedido.getProduto(), emp, pedido.getQuantidade());
                //retorn -1 referece produto do tipo Cozinha
                if (qtd == -1) {
                    pedido.setVenda(nvenda);
                    pedido.setStatus("Pendente");
                    p.adicionar(pedido);
                } else if (qtd >= pedido.getQuantidade()) {
                    System.out.println("Balcao");
                    cp.diminuiEstoque(pedido.getProduto(), pedido.getQuantidade(), qtd);
                    pedido.setStatus("Realizado");
                    adiciona(pedido, emp);

                } else {
                    ret += " , produto : " + pedido.getProduto() + ",";
                }
            }
        }
        if (ret.equals("Sucesso")) {
            return ret;
        } else {
            ret += ", esta(ão) com estoque insuficiente(s)!";
            return ret;
        }
    }

    public ArrayList<Mesa> getMesasAbertas(int emp) {
        VendaDAO ven = new VendaDAO();
        ControleCaixa cc = new ControleCaixa();
        return ven.listarMesasAbertas(cc.getCaixa(emp));
    }

    public ArrayList<Mesa> getMesaAberta(int emp) {
        VendaDAO ven = new VendaDAO();
        ControleCaixa cc = new ControleCaixa();
        int caixa = cc.getCaixa(emp);
        if (caixa > 0) {
            return ven.listarMesaAberta(cc.getCaixa(emp));
        } else {
            return null;
        }
    }

    public float getValorMesa(String mesa, int emp) {
        VendaDAO ven = new VendaDAO();
        int venda = getVenda(Integer.parseInt(mesa), emp);
        return ven.getValorMesa(venda);
    }

    public ArrayList<ProdutosGravados> listarProdutosMesa(String text, int emp) {
        //verificar se mesa esta aberta
        VendaDAO ven = new VendaDAO();
        PedidoDAO p = new PedidoDAO();
        ControleCaixa cc = new ControleCaixa();
        int caixa = cc.getCaixa(emp);
        int mesa = Integer.parseInt(text);
        if (ven.getVenda(mesa, caixa) != 0) {
            return p.produtosMesa(mesa, caixa);
        } else {
            return null;
        }
    }

    public String transferirMesa(String origem, String destino, int emp) throws WriterException, IOException {
        VendaDAO ven = new VendaDAO();
        PedidoDAO p = new PedidoDAO();
        ControleCaixa ca = new ControleCaixa();
        int caixa = ca.getCaixa(emp);
        int des = getVenda(Integer.parseInt(destino), emp);
        if (des == 0) {
            des = abrirMesa(destino, caixa);
        }
        p.transferirMesa(getVenda(Integer.parseInt(origem), emp), des);
        ven.excluir(getVenda(Integer.parseInt(origem), emp));
        return "sucesso!";
    }

    public int getVenda(int mesa, int emp) {
        VendaDAO ven = new VendaDAO();
        ControleCaixa cc = new ControleCaixa();
        return ven.getVenda(mesa, cc.getCaixa(emp));
    }

    private int abrirMesa(String mesa, int caixa) {
        VendaDAO ven = new VendaDAO();
        VendaBEAN v = new VendaBEAN();
        v.setCaixa(caixa);
        v.setCheckIn(getHoraAtual());
        v.setMesa(Integer.parseInt(mesa));
        int venda = ven.abrirMesa(v);
        byte[] qr = null;
        try {
            qr = QRCode.getQRCodeImage(mesa, 350, 350);
        } catch (WriterException ex) {
            Logger.getLogger(ControleVenda.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ControleVenda.class.getName()).log(Level.SEVERE, null, ex);
        }
        ven.inserirQRCode(qr, venda);
        System.out.println("Abrir mesa");
        return venda;
    }

    public int abrirMesaM(String mesa, int empresa) {
        ControleCaixa cc = new ControleCaixa();
        VendaDAO ven = new VendaDAO();
        VendaBEAN v = new VendaBEAN();
        int caixa = cc.getCaixa(empresa);
        if (caixa > 0) {
            v.setCaixa(cc.getCaixa(empresa));
            v.setCheckIn(getHoraAtual());
            v.setMesa(Integer.parseInt(mesa));
            int venda = ven.getVenda(v.getMesa(), v.getCaixa());
            if (venda == 0) {
                int vend = ven.abrirMesa(v);
                System.out.println("Mesa : " + mesa);
                byte[] qr = null;
                try {
                    qr = QRCode.getQRCodeImage(v.getMesa() + "", 350, 350);
                } catch (WriterException ex) {
                    Logger.getLogger(ControleVenda.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(ControleVenda.class.getName()).log(Level.SEVERE, null, ex);
                }
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

    public String transferirPedido(String mesaDestino, String pedido, int emp) throws WriterException, IOException {
        PedidoDAO p = new PedidoDAO();
        ControleCaixa ca = new ControleCaixa();
        int caixa = ca.getCaixa(emp);
        int destino = Integer.parseInt(mesaDestino);
        int pedi = Integer.parseInt(pedido);
        int des = getVenda(destino, emp);
        if (des == 0) {
            des = abrirMesa(mesaDestino, caixa);
        }
        p.transferir(pedi, getVenda(destino, emp));
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

    public int gerarMesaBalcao(int emp) {
        ControleCaixa cc = new ControleCaixa();
        PedidoDAO p = new PedidoDAO();
        int mesa = p.getMesaBalcaoAberta(cc.getCaixa(emp));
        if (mesa > 0) {
            return mesa;
        } else {
            mesa = p.getMaxMesa(cc.getCaixa(emp));
            if (mesa > 100) {
                return ++mesa;
            } else {
                return 101;
            }
        }
    }

    public ArrayList<VendaBEAN> listarVendasAbertas(int emp) {
        ControleCaixa cc = new ControleCaixa();
        VendaDAO ven = new VendaDAO();
        return ven.listarVendasAbertas(cc.getCaixa(emp));
    }

    public ArrayList<VendaBEAN> listarVendasFechadas(int emp) {
        ControleCaixa cc = new ControleCaixa();
        VendaDAO ven = new VendaDAO();
        return ven.listarVendasFechadas(cc.getCaixa(emp));
    }

    public ArrayList<Venda> getVendasPorData(int emp, String ini, String fin) {
        VendaDAO ven = new VendaDAO();
        return ven.listarVendasPorInData(emp, ini, fin);
    }

    public ArrayList<Venda> getVendasPorStatus(int emp, String status) {
        VendaDAO ven = new VendaDAO();
        return ven.listarVendasPorStatus(emp, status);
    }

    public ArrayList<Venda> getVendasPorConsulta(int emp, String texto) {
        VendaDAO ven = new VendaDAO();
        return ven.listarVendasPorConsulta(emp, texto);
    }

    public float getTotalVendido(int emp) {
        ControleCaixa cc = new ControleCaixa();
        VendaDAO ven = new VendaDAO();
        return ven.getTotalVendido(cc.getCaixa(emp));
    }

    public ArrayList<ProdutosGravados> listarProdutosVendidosCaixa(int emp) {
        ControleCaixa cc = new ControleCaixa();
        VendaDAO ven = new VendaDAO();
        return ven.listarProdutosVendidosCaixa(cc.getCaixa(emp));
    }

    public String isMesasAbertas(int emp) {
        ControleCaixa cc = new ControleCaixa();
        VendaDAO ven = new VendaDAO();
        return ven.isVendasAbertas(cc.getCaixa(emp));
    }

    private int adiciona(PedidoBEAN venda, int emp) {
        int pedido = 0;
        int mesa = venda.getVenda();
        ControleCaixa cc = new ControleCaixa();
        int caixa = cc.getCaixa(emp);
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

    public String adicionarClienteVenda(int venda, int cliente) {
        VendaDAO ven = new VendaDAO();
        boolean aux = ven.adicionarClienteVenda(venda, cliente);
        if (aux) {
            return "Sucesso";
        } else {
            return "ERRO";
        }
    }

    public Venda getVenda(int venda) {
        VendaDAO ven = new VendaDAO();
        return ven.buscarVenda(venda);
    }

    public ArrayList<Venda> getVendas(int emp) {
        VendaDAO ven = new VendaDAO();
        ControleCaixa cc = new ControleCaixa();
        return ven.listarVendas(emp);
    }
}
