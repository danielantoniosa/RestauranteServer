/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.persistencia;

import com.server.restauranteserver.beans.Mesa;
import com.server.restauranteserver.beans.ProdutosGravados;
import com.server.restauranteserver.beans.Venda;
import com.server.restauranteserver.beans.VendaBEAN;
import com.server.restauranteserver.util.Time;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Daniel
 */
public class VendaDAO {

    private Connection connection;

    public VendaDAO() {
        this.connection = ConnectionFactory.getConnection();;
    }

    public int abrirMesa(VendaBEAN c, String u, String s) {
        int lastId = 0;
        String sql = "insert into venda(venCheckIn,venMesa, venStatus,ven_caiCodigo) values (?,?,?,"
                + "(select caiCodigo from empresa join caixa where empCodigo = cai_empCodigo and empEmail = '" + u + "' and empSenha = '" + s + "'and caiStatus='aberto'))";
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, c.getCheckIn());
            stmt.setInt(2, c.getMesa());
            stmt.setString(3, "aberta");
            stmt.executeUpdate();
            final ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                lastId = rs.getInt(1);
            }
            stmt.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return lastId;
    }

    //INSERE QRCODE NA VENDA
    public void inserirQRCode(byte[] qr, int cod) {
        String sql = "update venda set venQRcode = '" + qr + "'  where venCodigo = " + cod + ";";
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            int l = stmt.executeUpdate();
            stmt.close();
            if (l > 0) {
                System.out.println("Foram alterados " + l + " linhas");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    private int getVenda(String hora, int caixa) {
        int cod = 0;
        String sql = "select venCodigo from venda where venCheckIn = '" + hora + "' and ven_caiCodigo =" + caixa + " ;";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                cod = rs.getInt(1);

            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return cod;
    }

    public VendaBEAN listarVenda(int mesa, String u, String s) {
        VendaBEAN v = new VendaBEAN();
        String sql = "select * from venda join caixa join empresa where"
                + " empCodigo = cai_empCodigo and ven_caiCodigo = caiCodigo and venMesa = " + mesa + " and "
                + " caiStatus = 'aberto' and venStatus = 'aberta' and empEmail = '" + u + "' and empSenha = '" + s + "' ;";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                v.setCodigo(rs.getInt(1));
                v.setQRcode(rs.getBytes(2));
                v.setCheckIn(rs.getString(3));
                v.setCheckOut(rs.getString(4));
                v.setValor(rs.getFloat(5));
                v.setCusto(rs.getFloat(6));
                v.setMesa(rs.getInt(7));
                v.setStatus(rs.getString(8));
                v.setPagamento(rs.getString(9));
                v.setDesconto(rs.getFloat(10));
                v.setCaixa(rs.getInt(11));

            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return v;
    }

    /*public ArrayList<Mesa> listarMesaAberta(String u, String s) {
        ArrayList<Mesa> c = new ArrayList<>();

        String sql = "select (venMesa) as mesa , venStatus, venCodigo,\n"
                + "                COALESCE((select  sum(pedQTD*proPreco) \n"
                + "                from venda join pedido join produto where  ped_venCodigo = venCodigo and ped_proCodigo = proCodigo \n"
                + "                and ven_caiCodigo = " + caixa + " and venStatus = 'aberta' and ped_excCodigo is null and mesa = venMesa ),0) \n"
                + "                as valor from \n"
                + "                caixa join venda  \n"
                + "                where  caiCodigo = ven_caiCodigo and ven_caiCodigo = " + caixa + " \n"
                + "				and caiStatus = 'aberto'and venStatus = 'aberta'  \n"
                + "                group by venMesa;";
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Mesa ca = new Mesa();
                ca.setMesa(rs.getInt(1));
                ca.setStatus(rs.getString(2));
                ca.setVenda(rs.getInt(3));
                ca.setValor(rs.getFloat(4));
                c.add(ca);
            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return c;
    }*/
    public int transferirMesa(int origem, int destino, String u, String s) {
        int l = 0;
        String sql = "update empresa join caixa join venda set venMesa = " + destino
                + " where empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo and venStatus = 'aberta' and caiStatus = 'aberto'"
                + " and empEmail = '" + u + "' and empSenha = '" + s + "' and venMesa = " + origem + " ;";

        try {
            PreparedStatement stmt = (PreparedStatement) connection.prepareStatement(sql);
            l = stmt.executeUpdate();
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return l;
    }

    public ArrayList<Mesa> listarMesasAbertas(String u, String s) {
        ArrayList<Mesa> c = new ArrayList<>();

        String sql = "select (venMesa) as mesa , venStatus,venCodigo,\n"
                + "round((select  sum(pedQTD*proPreco)\n"
                + "from empresa join venda join pedido join produto where ped_venCodigo = venCodigo and ped_proCodigo = proCodigo and pro_empCodigo = empCodigo and venStatus = 'aberta' and ped_excCodigo is null and venMesa = mesa  and empEmail = '" + u + "' and empSenha = '" + s + "'),2) as valor from\n"
                + " empresa join caixa join venda \n"
                + "where \n"
                + "empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo and empEmail = '" + u + "' and empSenha = '" + s + "' and caiStatus = 'aberto'and venStatus = 'aberta'  \n"
                + "group by venMesa;";
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Mesa ca = new Mesa();
                ca.setMesa(rs.getInt(1));
                ca.setStatus(rs.getString(2));
                ca.setVenda(rs.getInt(3));
                ca.setValor(rs.getFloat(4));
                c.add(ca);
            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return c;
    }

    public int atualizaVenda(VendaBEAN c, String u, String s) {
        int lastId = 0;
        String sql = "update venda inner join caixa on (caiCodigo = ven_caiCodigo) inner join empresa on (empCodigo = cai_empCodigo)  set venCheckOut = '" + c.getCheckOut() + "' , venValor = " + c.getValor() + " , venPagamento = '" + c.getPagamento()
                + "',venDesconto = " + c.getDesconto() + " ,venStatus = 'fechada' "
                + "  where venCodigo = " + c.getCodigo() + " and empEmail = '" + u + "' and empSenha = '" + s + "';";
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.executeUpdate();
            final ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                lastId = rs.getInt(22);
            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return lastId;
    }

    public boolean isPagamentoUtlizado(int pagamento, String u, String s) {
        int cod = 0;
        String sql = "select venCodigo from venda join caixa join empresa where "
                + "empCodigo = cai_empCodigo and ven_caiCodigo = caiCodigo and  caiStatus = 'aberto' and empEmail = '" + u + "' and empSenha = '" + s + "' and venPagamento= '" + pagamento + "';";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                cod = rs.getInt(1);

            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        if (cod == 0) {
            return false;
        } else {
            return true;
        }
    }

    public int getVenda(int mesa, String u, String s) {
        int cod = 0;
        String sql = "select venCodigo from venda join caixa join empresa where empCodigo = cai_empCodigo"
                + " and ven_caiCodigo = caiCodigo and  caiStatus = 'aberto' and empEmail = '" + u + "' "
                + "and empSenha = '" + s + "' and venMesa = " + mesa + " and venStatus = 'aberta';";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                cod = rs.getInt(1);
            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        //retorna 0 se não tiver nenhuma venda naquela mesa
        return cod;
    }

    public void excluir(int venda) {
        String sql = "delete from venda where venCodigo = " + venda + ";";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public float getValorMesa(int mesa, String u, String s) {
        float total = 0;
        String sql = "select round(sum(pedQTD*proPreco),2) \n"
                + "from\n"
                + " empresa join caixa join venda join pedido join produto \n"
                + "	where\n"
                + "    empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo and ped_venCodigo = venCodigo \n"
                + "    and ped_proCodigo = proCodigo and caiStatus = 'aberto'and venStatus = 'aberta' and ped_excCodigo is null"
                + " and venMesa =" + mesa + " and empEmail = '" + u + "' "
                + "and empSenha = '" + s + "' group by venMesa;";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                total = rs.getFloat(1);
            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return total;
    }

    public ArrayList<VendaBEAN> listarVendasAbertas(String u, String s) {
        ArrayList<VendaBEAN> vendas = new ArrayList<VendaBEAN>();
        String sql = "select * from venda join caixa join empresa where empCodigo = cai_empCodigo and ven_caiCodigo = caiCodigo"
                + " and  caiStatus = 'aberto' and empEmail = '" + u + "' and empSenha = '" + s + "' and venStatus = 'aberta' ;";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                VendaBEAN v = new VendaBEAN();
                v.setCodigo(rs.getInt(1));
                v.setQRcode(rs.getBytes(2));
                v.setCheckIn(rs.getString(3));
                v.setCheckOut(rs.getString(4));
                v.setValor(rs.getFloat(5));
                v.setCusto(rs.getFloat(6));
                v.setMesa(rs.getInt(7));
                v.setStatus(rs.getString(8));
                v.setPagamento(rs.getString(9));
                v.setDesconto(rs.getFloat(10));
                v.setCaixa(rs.getInt(11));
                vendas.add(v);

            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return vendas;
    }

    public ArrayList<VendaBEAN> listarVendasFechadas(String u, String s) {
        ArrayList<VendaBEAN> vendas = new ArrayList<VendaBEAN>();
        String sql = "select * from venda join caixa join empresa where empCodigo = cai_empCodigo and ven_caiCodigo ="
                + " caiCodigo and  caiStatus = 'aberto' and empEmail = '" + u + "' and empSenha = '" + s + "' and"
                + "  venStatus = 'fechada';";
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                VendaBEAN v = new VendaBEAN();
                v.setCodigo(rs.getInt(1));
                v.setQRcode(rs.getBytes(2));
                v.setCheckIn(rs.getString(3));
                v.setCheckOut(rs.getString(4));
                v.setValor(rs.getFloat(5));
                v.setCusto(rs.getFloat(6));
                v.setMesa(rs.getInt(7));
                v.setStatus(rs.getString(8));
                v.setPagamento(rs.getString(9));
                v.setDesconto(rs.getFloat(10));
                v.setCaixa(rs.getInt(11));
                vendas.add(v);

            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return vendas;
    }

    public float getTotalVendido(String u, String s) {
        float total = 0;
        String sql = "select COALESCE(sum(venValor),0)  "
                + "from venda join caixa join empresa where empCodigo = cai_empCodigo and ven_caiCodigo = caiCodigo and  "
                + "caiStatus = 'aberto' and empEmail = '" + u + "' and empSenha = '" + s + "'"
                + "and  venStatus = 'fechada' group by caiCodigo;";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                total = rs.getFloat(1);
            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return total;
    }

    public ArrayList<ProdutosGravados> listarProdutosVendidosCaixa(String u, String s) {
        ArrayList<ProdutosGravados> c = new ArrayList<ProdutosGravados>();

        String sql = "SELECT  proCodigo, proNome,sum(pedQTD) as unidades ,proPreco from \n"
                + "produto join pedido join venda join caixa join empresa where empCodigo = cai_empCodigo and ven_caiCodigo = caiCodigo and  "
                + "caiStatus = 'aberto' and empEmail = '" + u + "' and empSenha = '" + s + "' and venCodigo = ped_venCodigo and ped_proCodigo = "
                + "proCodigo and venStatus = 'fechada' and ped_excCodigo is null \n"
                + " group by proCodigo;";
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ProdutosGravados ca = new ProdutosGravados();

                ca.setCodProduto(rs.getInt(1));
                ca.setNome(rs.getString(2));
                ca.setQuantidade(rs.getFloat(3));
                ca.setValor(rs.getFloat(4));
                c.add(ca);
            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return c;
    }

    public String isVendasAbertas(String u, String s) {
        int total = 0;
        String sql = "SELECT count(venCodigo) FROM venda join caixa join empresa where empCodigo = cai_empCodigo and ven_caiCodigo = caiCodigo and  caiStatus = 'aberto' and empEmail = '" + u + "' and empSenha = '" + s + "' and venStatus = 'aberta';";
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                total = rs.getInt(1);
            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return total + "";
    }

    public boolean adicionarClienteVenda(int venda, int cliente) {
        String sql = "update venda set ven_cliCodigo = " + cliente + "  where venCodigo = " + venda + " ;";
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            int l = stmt.executeUpdate();
            stmt.close();
            if (l > 0) {
                System.out.println("Foram alterados " + l + " linhas");
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public ArrayList<Venda> listarVendasPorStatus(String u, String s, String status) {
        ArrayList<Venda> c = new ArrayList<>();

        String sql = "select (venCodigo)as venda, venCheckIn,COALESCE((select  sum(pedQTD*proPreco) from venda join pedido join produto where  ped_venCodigo = venCodigo and ped_proCodigo = proCodigo and venda = venCodigo ),0) as valor,\n"
                + "                                   venCusto,\n"
                + "                                  venStatus,venPagamento,venDesconto,\n"
                + "                                   (select cliNome from venda join cliente where ven_cliCodigo = cliCodigo and venCodigo = venda) as cliente,\n"
                + "           			(COALESCE((select  sum(pedQTD*proPreco) from venda join pedido join produto where  ped_venCodigo = venCodigo and ped_proCodigo = proCodigo and venda = venCodigo ) ,0))as valorFim, caiData	"
                + "                             from\n empresa join"
                + "                              caixa join venda \n"
                + "                                        where empCodigo = cai_empCodigo and \n"
                + "                                 caiCodigo = ven_caiCodigo  and empEmail = '" + u + "' and empSenha = '" + s + "' and venStatus = '" + status + "';";
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Venda ca = new Venda();
                ca.setCodigo(rs.getInt(1));
                ca.setHora(rs.getString(2));
                ca.setValor(rs.getFloat(3));
                ca.setCusto(rs.getFloat(4));
                ca.setStatus(rs.getString(5));
                ca.setPagamento(rs.getString(6));
                ca.setDesconto(rs.getFloat(7));
                ca.setCliente(rs.getString(8));
                ca.setValorFinal(rs.getInt(9));
                ca.setData(Time.formataDataBR(rs.getString(10)));
                c.add(ca);
            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return c;
    }

    public ArrayList<Venda> listarVendasPorConsulta(String u, String s, String cliente) {
        ArrayList<Venda> c = new ArrayList<>();

        String sql = "select (venCodigo)as venda, venCheckIn,COALESCE((select  sum(pedQTD*proPreco) from venda join pedido join produto where  ped_venCodigo = venCodigo and ped_proCodigo = proCodigo and venda = venCodigo ),0) as valor,\n"
                + "                                   venCusto,\n"
                + "                                  venStatus,venPagamento,venDesconto,\n"
                + "                                   (select cliNome from venda join cliente where ven_cliCodigo = cliCodigo and venCodigo = venda) as cliente,\n"
                + "           			(COALESCE((select  sum(pedQTD*proPreco) from venda join pedido join produto where  ped_venCodigo = venCodigo and ped_proCodigo = proCodigo and venda = venCodigo ) ,0))as valorFim, caiData	"
                + "                             from\n"
                + "                             empresa join caixa join venda join cliente\n"
                + "                                        where \n"
                + "                                 empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo and cliCodigo = ven_cliCodigo   and empEmail = '" + u + "' and empSenha = '" + s + "' and cliNome like '" + cliente + "%' ;";
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Venda ca = new Venda();
                ca.setCodigo(rs.getInt(1));
                ca.setHora(rs.getString(2));
                ca.setValor(rs.getFloat(3));
                ca.setCusto(rs.getFloat(4));
                ca.setStatus(rs.getString(5));
                ca.setPagamento(rs.getString(6));
                ca.setDesconto(rs.getFloat(7));
                ca.setCliente(rs.getString(8));
                ca.setValorFinal(rs.getInt(9));
                ca.setData(Time.formataDataBR(rs.getString(10)));
                c.add(ca);
            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return c;
    }

    public ArrayList<Venda> listarVendasPorInData(String u, String s, String dataIn, String dataFin) {
        ArrayList<Venda> c = new ArrayList<>();

        String sql = "select (venCodigo)as venda, venCheckIn,COALESCE((select  sum(pedQTD*proPreco) from venda join pedido join produto where  ped_venCodigo = venCodigo and ped_proCodigo = proCodigo and venda = venCodigo ),0) as valor,\n"
                + "                                   venCusto,\n"
                + "                                  venStatus,venPagamento,venDesconto,\n"
                + "                                   (select cliNome from venda join cliente where ven_cliCodigo = cliCodigo and venCodigo = venda) as cliente,\n"
                + "           			(COALESCE((select  sum(pedQTD*proPreco) from venda join pedido join produto where  ped_venCodigo = venCodigo and ped_proCodigo = proCodigo and venda = venCodigo ) ,0))as valorFim, caiData	"
                + "                             from\n"
                + "                             empresa join caixa join venda \n"
                + "                                        where \n"
                + "                                 caiCodigo = ven_caiCodigo  and empCodigo = cai_empCodigo  and empEmail = '" + u + "' and empSenha = '" + s + "'  and caiData between '" + dataIn + "' and '" + dataFin + "'  ;";
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Venda ca = new Venda();
                ca.setCodigo(rs.getInt(1));
                ca.setHora(rs.getString(2));
                ca.setValor(rs.getFloat(3));
                ca.setCusto(rs.getFloat(4));
                ca.setStatus(rs.getString(5));
                ca.setPagamento(rs.getString(6));
                ca.setDesconto(rs.getFloat(7));
                ca.setCliente(rs.getString(8));
                ca.setValorFinal(rs.getInt(9));
                ca.setData(Time.formataDataBR(rs.getString(10)));
                c.add(ca);
            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return c;
    }

    public Venda buscarVenda(int mesa, String u, String s) {
        Venda v = new Venda();
        String sql2 = "select (venCodigo)as venda, venCheckIn,round((select  sum(pedQTD*proPreco) from venda join pedido join produto where  ped_venCodigo = venCodigo and ped_proCodigo = proCodigo and venda = venCodigo ),2) as valor,\n"
                + "		venCusto,venStatus,venPagamento,venDesconto,\n"
                + "		COALESCE((select cliNome from venda join cliente where ven_cliCodigo = cliCodigo and venCodigo = venda),'Cliente Especial')as cliente,\n"
                + "		(round((select  sum(pedQTD*proPreco) from venda join pedido join produto where  ped_venCodigo = venCodigo and ped_proCodigo = proCodigo and venda = venCodigo ) ,2))as valorFim	from\n"
                + "		empresa join caixa join venda where empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo  and venMesa = " + mesa + " and venStatus = 'aberta' and empEmail = '" + u + "' and empSenha = '" + s + "';";
        System.out.println(sql2);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql2);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                v.setCodigo(rs.getInt(1));
                v.setHora(rs.getString(2));
                v.setValor(rs.getFloat(3));
                v.setCusto(rs.getFloat(4));
                v.setStatus(rs.getString(5));
                v.setPagamento(rs.getString(6));
                v.setDesconto(rs.getFloat(7));
                v.setCliente(rs.getString(8));
                v.setValorFinal(rs.getInt(9));

            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return v;
    }

    public ArrayList<Venda> listarVendas(String u, String s) {
        ArrayList<Venda> c = new ArrayList<>();

        String sql = "select (venCodigo)as venda, venCheckIn,COALESCE((select  sum(pedQTD*proPreco) from venda join pedido join produto where  ped_venCodigo = venCodigo and ped_proCodigo = proCodigo and venda = venCodigo ),0) as valor,\n"
                + "                                   venCusto,\n"
                + "                                  venStatus,venPagamento,venDesconto,\n"
                + "                                   (select cliNome from venda join cliente where ven_cliCodigo = cliCodigo and venCodigo = venda) as cliente,\n"
                + "           			(COALESCE((select  sum(pedQTD*proPreco) from venda join pedido join produto where  ped_venCodigo = venCodigo and ped_proCodigo = proCodigo and venda = venCodigo ) ,0))as valorFim, caiData	"
                + "                             from\n"
                + "                              empresa join caixa join venda \n"
                + "                                        where \n"
                + "                                 caiCodigo = ven_caiCodigo  and empCodigo = cai_empCodigo and empEmail = '" + u + "' and empSenha = '" + s + "' ;";
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Venda ca = new Venda();
                ca.setCodigo(rs.getInt(1));
                ca.setHora(rs.getString(2));
                ca.setValor(rs.getFloat(3));
                ca.setCusto(rs.getFloat(4));
                ca.setStatus(rs.getString(5));
                ca.setPagamento(rs.getString(6));
                ca.setDesconto(rs.getFloat(7));
                ca.setCliente(rs.getString(8));
                ca.setValorFinal(rs.getInt(9));
                ca.setData(Time.formataDataBR(rs.getString(10)));
                c.add(ca);
            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return c;
    }
}
