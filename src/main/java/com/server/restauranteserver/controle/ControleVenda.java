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

    public VendaBEAN listarVenda(int mesa, String u, String s) {
        VendaDAO ven = new VendaDAO();
        //
        return ven.listarVenda(mesa, u, s);
    }

    public String atualizaVenda(VendaBEAN v, String u, String s) {
        VendaDAO ven = new VendaDAO();
        VendaBEAN venda = listarVenda(v.getMesa(), u, s);
        venda.setCheckOut(v.getCheckOut());
        venda.setPagamento(v.getPagamento());
        venda.setValor(v.getValor());
        venda.setDesconto(v.getDesconto());
        //
        ven.atualizaVenda(venda, u, s);
        return "sucesso";
    }

    public File atualizaVendaNota(VendaBEAN v, String u, String s, ServletContext contexto) {
        ControleRelatorio r = new ControleRelatorio();
        VendaDAO ven = new VendaDAO();
        //
        int emp = ven.atualizaVenda(v, u, s);
        System.out.println(emp);
        //
        return r.geraRelatorioVenda(contexto, v.getCodigo(), emp);
    }

    public int abrirMesa(VendaBEAN v, String u, String s) {
        VendaDAO ven = new VendaDAO();
        //
        return ven.abrirMesa(v, u, s);
    }

    public int abrirMesa(int mesa, String u, String s) {
        VendaDAO ven = new VendaDAO();
        VendaBEAN v = new VendaBEAN();
        v.setCheckIn(Time.getTime());
        v.setMesa(mesa);
        v.setStatus("aberta");
        //
        return ven.abrirMesa(v, u, s);
    }

    public int adicionar(PedidoBEAN venda, String u, String s) {
        int pedido = 0;
        int mesa = venda.getVenda();
        //verificar se contem produto em estoque para produtos diferentes do tipo de cozinha
        ControleProduto cp = new ControleProduto();
        //1
        float qtd = cp.quantidadeEstoque(venda.getProduto(), venda.getQuantidade());
        //retorn -1 referece produto do tipo Cozinha
        System.out.println("quantidade :" + qtd);
        //1
        VendaDAO ven = new VendaDAO();
        int codVen = ven.getVenda(mesa, u, s);
        if (codVen == 0) {
            codVen = abrirMesa(mesa + "", u, s);
        }
        venda.setVenda(codVen);
        //retorn -1 referece produto do tipo Cozinha
        if (qtd == -1) {
            venda.setStatus("Pendente");
            adiciona(venda, u, s);
        } else if (qtd >= venda.getQuantidade()) {
            System.out.println("Balcao");
            //4
            cp.diminuiEstoque(venda.getProduto(), venda.getQuantidade(), qtd);
            venda.setStatus("Realizado");
            adiciona(venda, u, s);
        } else {
            return -1;
        }
        return 1;
    }

    public String adicionar(ArrayList<PedidoBEAN> venda, String u, String s) throws WriterException, IOException {
        ArrayList<PedidoBEAN> p = new ArrayList<>();
        String ret = "Sucesso";
        int mesa = venda.get(0).getVenda();
        VendaDAO ven = new VendaDAO();
        int codVen = 0;
        //1
        codVen = ven.getVenda(mesa, u, s);
        if (codVen == 0) {
        } else {
            //2
            codVen = abrirMesa(mesa + "", u, s);
        }
        for (PedidoBEAN pedido : venda) {
            //verificar se contem produto em estoque para produtos diferentes do tipo de cozinha
            ControleProduto cp = new ControleProduto();
            //3
            float qtd = cp.quantidadeEstoque(pedido.getProduto(), pedido.getQuantidade());
            //retorn -1 referece produto do tipo Cozinha
            pedido.setVenda(codVen);
            if (qtd == -1) {
                pedido.setStatus("Pendente");
                p.add(pedido);
            } else if (qtd >= pedido.getQuantidade()) {
                System.out.println("Balcao");
                //4
                cp.diminuiEstoque(pedido.getProduto(), pedido.getQuantidade(), qtd);
                pedido.setStatus("Realizado");
                p.add(pedido);
            } else {
                ret += " , produto : " + pedido.getProduto() + ",";
            }
        }
        adiciona(p, u, s);
        return ret;
    }

    public ArrayList<Mesa> getMesasAbertas(String u, String s) {
        VendaDAO ven = new VendaDAO();
        return ven.listarMesasAbertas(u, s);
    }

    public ArrayList<Mesa> getMesaAberta(String u, String s) {
        VendaDAO ven = new VendaDAO();
        return ven.listarMesasAbertas(u, s);
    }

    public float getValorMesa(String mesa, String u, String s) {
        VendaDAO ven = new VendaDAO();
        return ven.getValorMesa(Integer.parseInt(mesa), u, s);
    }

    public ArrayList<ProdutosGravados> listarProdutosMesa(String text, String u, String s) {
        //verificar se mesa esta aberta
        PedidoDAO p = new PedidoDAO();
        int mesa = Integer.parseInt(text);
        return p.produtosMesa(mesa, u, s);
    }

    public String transferirMesa(String origem, String destino, String u, String s) throws WriterException, IOException {
        VendaDAO ven = new VendaDAO();
        int aux = ven.transferirMesa(Integer.parseInt(origem), Integer.parseInt(destino), u, s);
        if (aux > 0) {
            return "sucesso!";
        } else {
            return "Erro!";
        }
    }

    public int getVenda(int mesa, String u, String s) {
        VendaDAO ven = new VendaDAO();
        return ven.getVenda(mesa, u, s);
    }

    private int abrirMesa(String mesa, String u, String s) {
        VendaDAO ven = new VendaDAO();
        VendaBEAN v = new VendaBEAN();
        v.setCheckIn(getHoraAtual());
        v.setMesa(Integer.parseInt(mesa));
        int venda = ven.abrirMesa(v, u, s);
        byte[] qr = null;
        try {
            qr = QRCode.getQRCodeImage(mesa, 350, 350);

        } catch (WriterException ex) {
            Logger.getLogger(ControleVenda.class
                    .getName()).log(Level.SEVERE, null, ex);

        } catch (IOException ex) {
            Logger.getLogger(ControleVenda.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        //ven.inserirQRCode(qr, venda);
        System.out.println("Abrir mesa");
        return venda;
    }

    public int abrirMesaM(String mesa, String u, String s) {
        VendaDAO ven = new VendaDAO();
        VendaBEAN v = new VendaBEAN();
        v.setCheckIn(getHoraAtual());
        v.setMesa(Integer.parseInt(mesa));
        //
        int venda = ven.getVenda(Integer.parseInt(mesa), u, s);
        if (venda == 0) {
            //
            int vend = ven.abrirMesa(v, u, s);
            System.out.println("Mesa : " + mesa);
            byte[] qr = null;
            try {
                qr = QRCode.getQRCodeImage(v.getMesa() + "", 350, 350);

            } catch (WriterException ex) {
                Logger.getLogger(ControleVenda.class
                        .getName()).log(Level.SEVERE, null, ex);

            } catch (IOException ex) {
                Logger.getLogger(ControleVenda.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
            //
            // ven.inserirQRCode(qr, vend);
            return vend;
        } else {
            return 0;
        }

    }

    private String getHoraAtual() {
        return Time.getTime();
    }

    public String transferirPedido(String mesaDestino, String pedido, String u, String s) throws WriterException, IOException {
        PedidoDAO p = new PedidoDAO();
        int destino = Integer.parseInt(mesaDestino);
        int pedi = Integer.parseInt(pedido);
        int aux = getVenda(destino, u, s);
        if (aux == 0) {
            int des = abrirMesa(mesaDestino, u, s);
            p.transferir(pedi, destino, u, s);
        }

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

    public int gerarMesaBalcao(String u, String s) {
        PedidoDAO p = new PedidoDAO();
        int mesa = p.getMaxMesa(u, s);
        if (mesa > 100) {
            return ++mesa;
        } else {
            return 101;
        }
    }

    public ArrayList<VendaBEAN> listarVendasAbertas(String u, String s) {
        VendaDAO ven = new VendaDAO();
        return ven.listarVendasAbertas(u, s);
    }

    public ArrayList<VendaBEAN> listarVendasFechadas(String u, String s) {
        VendaDAO ven = new VendaDAO();
        return ven.listarVendasFechadas(u, s);
    }

    public ArrayList<Venda> getVendasPorData(String u, String s, String ini, String fin) {
        VendaDAO ven = new VendaDAO();
        return ven.listarVendasPorInData(u, s, ini, fin);
    }

    public ArrayList<Venda> getVendasPorStatus(String u, String s, String status) {
        VendaDAO ven = new VendaDAO();
        return ven.listarVendasPorStatus(u, s, status);
    }

    public ArrayList<Venda> getVendasPorConsulta(String u, String s, String texto) {
        VendaDAO ven = new VendaDAO();
        return ven.listarVendasPorConsulta(u, s, texto);
    }

    public float getTotalVendido(String u, String s) {
        VendaDAO ven = new VendaDAO();
        return ven.getTotalVendido(u, s);
    }

    public ArrayList<ProdutosGravados> listarProdutosVendidosCaixa(String u, String s) {
        VendaDAO ven = new VendaDAO();
        return ven.listarProdutosVendidosCaixa(u, s);
    }

    public String isMesasAbertas(String u, String s) {
        VendaDAO ven = new VendaDAO();
        return ven.isVendasAbertas(u, s);
    }

    private int adiciona(PedidoBEAN venda, String u, String s) {
        int pedido = 0;
        PedidoDAO p = new PedidoDAO();
        pedido = p.adicionar(venda, u, s);
        return pedido;
    }

    private int adiciona(ArrayList<PedidoBEAN> venda, String u, String s) {
        String sql = "INSERT INTO pedido (pedTime,pedQTD,"
                + " pedObs,ped_venCodigo,ped_proCodigo,pedStatus )VALUES ";
        int pedido = 0;
        int cont = 0;
        PedidoDAO p = new PedidoDAO();
        for (PedidoBEAN pe : venda) {
            cont++;
            sql += " ('" + pe.getTime() + "'," + pe.getQuantidade() + " , '" + pe.getObservacao()
                    + "', " + pe.getVenda() + ", " + pe.getProduto() + ", " + pe.getStatus() + ")";
            if (venda.size() == cont) {
                sql += ";";
            } else {
                sql += ",";
            }
        }
        pedido = p.adicionar(sql);
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

    public Venda getValoresVenda(int mesa, String u, String s) {
        VendaDAO ven = new VendaDAO();
        return ven.buscarVenda(mesa,u,s);
    }

    public ArrayList<Venda> getVendas(String u, String s) {
        VendaDAO ven = new VendaDAO();
        return ven.listarVendas(u, s);
    }
}
