/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.persistencia;

import com.server.restauranteserver.beans.Pedido;
import com.server.restauranteserver.beans.PedidoBEAN;
import com.server.restauranteserver.beans.ProdutosGravados;
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
public class PedidoDAO {

    private Connection connection;

    public PedidoDAO() {
        this.connection = ConnectionFactory.getConnection();
    }

    public int adicionar(PedidoBEAN c, String u, String s) {
        int i = 0;
        String sql = "INSERT INTO pedido (pedTime,pedQTD,"
                + " pedObs,ped_venCodigo,ped_proCodigo,pedStatus )"
                + " VALUES (?, ?, ?, ?, ?, ?);";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, c.getTime());
            stmt.setFloat(2, c.getQuantidade());
            stmt.setString(3, c.getObservacao());
            stmt.setInt(4, c.getVenda());
            stmt.setInt(5, c.getProduto());
            stmt.setString(6, c.getStatus());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                i = rs.getInt(1);
            }
            stmt.close();
            return i;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return i;
        }
    }

    public int adicionar(String sql) {
        int i = 0;
        try {
            PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                i = rs.getInt(1);
            }
            stmt.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return i;
    }

    /* public ArrayList<PedidoBEAN> listarAll() {
        ArrayList<PedidoBEAN> c = new ArrayList<PedidoBEAN>();

        String sql = "select * from pedido where ped_excCodigo is null;";
        try {
            stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                PedidoBEAN ca = new PedidoBEAN();
                ca.setCodigo(rs.getInt(1));
                ca.setTime(rs.getString(2));
                ca.setObservacao(rs.getString(3));
                ca.setStatus(rs.getString(4));
                ca.setTimeF(rs.getString(5));
                ca.setExcluzao(rs.getInt(6));
                ca.setVenda(rs.getInt(7));
                c.add(ca);
            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return c;
    }*/
    public ArrayList<ProdutosGravados> produtosMesa(int mesa, String u, String s) {
        ArrayList<ProdutosGravados> c = new ArrayList<ProdutosGravados>();

        String sql = "SELECT pedCodigo,ped_proCodigo, proNome,pedQTD, pedTime,venMesa, (proPreco * pedQTD), venCodigo \n"
                + "                FROM empresa join caixa join venda join pedido join produto\n"
                + "                 where empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo and\n"
                + "                venCodigo = ped_venCodigo and ped_proCodigo = proCodigo and venMesa = " + mesa + " and venStatus = 'aberta' "
                + "                and ped_excCodigo is null and empEmail = '" + u + "' and caiStatus = 'aberto' and empSenha = '" + s + "';";
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ProdutosGravados ca = new ProdutosGravados();
                ca.setCodPedidVenda(rs.getInt(1));
                ca.setCodProduto(rs.getInt(2));
                ca.setNome(rs.getString(3));
                ca.setQuantidade(rs.getFloat(4));
                ca.setTime(rs.getString(5));
                ca.setMesa(rs.getInt(6));
                ca.setValor(rs.getFloat(7));
                ca.setCodVenda(rs.getInt(8));
                c.add(ca);
            }
            stmt.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return c;
    }

    public ArrayList<Pedido> listarPedidosAbertos(String u, String s) {
        ArrayList<Pedido> c = new ArrayList<Pedido>();

        String sql = "SELECT pedCodigo,proNome,venMesa,pedQTD, pedTime,proPreparo,pedObs,pedTimeF\n"
                + "                FROM empresa join caixa join venda join pedido join produto\n"
                + "                where\n"
                + "                empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo and venCodigo = ped_venCodigo and ped_proCodigo = proCodigo\n"
                + "                and empEmail = '" + u + "' and empSenha = '" + s + "' and caiStatus = 'aberto' and  proTipo = 'Cozinha' and pedStatus = 'Pendente' and venStatus = 'aberta' and ped_excCodigo is null;";
        try {
            PreparedStatement stmt = (PreparedStatement) connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Pedido ca = new Pedido();
                ca.setCodigo(rs.getInt(1));
                ca.setProduto(rs.getString(2));
                ca.setMesa(rs.getInt(3));
                ca.setQuantidade(rs.getFloat(4));
                ca.setHora_pedido(rs.getString(5));
                ca.setTempo_preparo(rs.getString(6));
                ca.setObservacao(rs.getString(7));
                ca.setHora_final(rs.getString(8));
                c.add(ca);
            }
            stmt.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return c;
    }

    public ArrayList<Pedido> listarPedidos(String u, String s) {
        ArrayList<Pedido> c = new ArrayList<Pedido>();

        String sql = "SELECT pedCodigo,proNome,venMesa,pedQTD, pedTime,proPreparo,pedObs,pedTimeF,pedStatus\n"
                + "                FROM empresa join caixa join venda join pedido join produto\n"
                + "                where\n"
                + "                empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo and venCodigo = ped_venCodigo and ped_proCodigo = proCodigo\n"
                + "                and empEmail = '" + u + "' and empSenha = '" + s + "' and caiStatus = 'aberto' and venStatus = 'aberta' and ped_excCodigo is null;";
        try {
            PreparedStatement stmt = (PreparedStatement) connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Pedido ca = new Pedido();
                ca.setCodigo(rs.getInt(1));
                ca.setProduto(rs.getString(2));
                ca.setMesa(rs.getInt(3));
                ca.setQuantidade(rs.getFloat(4));
                ca.setHora_pedido(rs.getString(5));
                ca.setTempo_preparo(rs.getString(6));
                ca.setObservacao(rs.getString(7));
                ca.setHora_final(rs.getString(8));
                ca.setStatus(rs.getString(9));
                c.add(ca);
            }
            stmt.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return c;
    }

    public ArrayList<Pedido> listarPedidosAtrazados(String u, String s) {
        ArrayList<Pedido> c = new ArrayList<Pedido>();

        String sql = "SELECT pedCodigo,proNome,venMesa,pedQTD, pedTime,proPreparo,pedObs,pedTimeF\n"
                + "                FROM empresa join caixa join venda join pedido join produto\n"
                + "                where\n"
                + "                empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo and venCodigo = ped_venCodigo and ped_proCodigo = proCodigo\n"
                + "                and empEmail = '" + u + "' and empSenha = '" + s + "' and caiStatus = 'aberto' and  proTipo ='Cozinha' and pedStatus = 'Atrazado' and venStatus = 'aberta' and ped_excCodigo is null;";
        try {
            PreparedStatement stmt = (PreparedStatement) connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Pedido ca = new Pedido();
                ca.setCodigo(rs.getInt(1));
                ca.setProduto(rs.getString(2));
                ca.setMesa(rs.getInt(3));
                ca.setQuantidade(rs.getFloat(4));
                ca.setHora_pedido(rs.getString(5));
                ca.setTempo_preparo(rs.getString(6));
                ca.setObservacao(rs.getString(7));
                ca.setHora_final(rs.getString(8));
                c.add(ca);
            }
            stmt.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return c;
    }

    public ArrayList<Pedido> listarPedidosRealizados(String u, String s) {
        ArrayList<Pedido> c = new ArrayList<Pedido>();

        String sql = "SELECT pedCodigo,proNome,venMesa,pedQTD, pedTime,proPreparo,pedObs,pedTimeF\n"
                + "                FROM empresa join caixa join venda join pedido join produto\n"
                + "                where\n"
                + "                empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo and venCodigo = ped_venCodigo and ped_proCodigo = proCodigo\n"
                + "                and empEmail = '" + u + "' and empSenha = '" + s + "' and caiStatus = 'aberto' and  proTipo ='Cozinha' and pedStatus = 'Realizado' and venStatus = 'aberta' and ped_excCodigo is null;";
        try {
            PreparedStatement stmt = (PreparedStatement) connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Pedido ca = new Pedido();
                ca.setCodigo(rs.getInt(1));
                ca.setProduto(rs.getString(2));
                ca.setMesa(rs.getInt(3));
                ca.setQuantidade(rs.getFloat(4));
                ca.setHora_pedido(rs.getString(5));
                ca.setTempo_preparo(rs.getString(6));
                ca.setObservacao(rs.getString(7));
                ca.setHora_final(rs.getString(8));
                c.add(ca);
            }
            stmt.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return c;
    }

    public PedidoBEAN localizar(int produto, int venda, String time) {
        PedidoBEAN ca = new PedidoBEAN();

        String sql = "select * from pedido where ped_proCodigo = " + produto + " and ped_venCondigo = " + venda + " and pedTime = '" + time + "' and ped_excCodigo is null;";
        try {
            PreparedStatement stmt = (PreparedStatement) connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ca.setCodigo(rs.getInt(1));
                ca.setTime(rs.getString(2));
                ca.setQuantidade(rs.getFloat(3));
                ca.setObservacao(rs.getString(4));
                ca.setTimeF(rs.getString(5));
                ca.setExcluzao(rs.getInt(6));
                ca.setProduto(rs.getInt(7));
                ca.setVenda(rs.getInt(8));

            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return ca;
    }

    public int transferir(int pedido, int mesa, String u, String s) {
        int l = 0;
        String sql = "update pedido set ped_venCodigo = (select venCodigo from empresa join caixa join venda where"
                + " empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo and venStatus = 'aberta' and caiStatus = 'aberto'"
                + " and empEmail = '" + u + "' and empSenha = '" + s + "' and venMesa = " + mesa + ") "
                + "where pedCodigo = " + pedido + " ;";
        System.out.println(sql);

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            l = stmt.executeUpdate();
            stmt.close();
            System.out.println("aux = "+l);
            if (l > 0) {
                System.out.println("Foram alterados " + l + " linhas");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return l;
    }

    public void mudarStatusAtrazado(int pedido) {
        String sql = "update pedido set pedStatus = 'Atrazado'  "
                + "where pedCodigo = " + pedido + " ;";

        try {
            PreparedStatement stmt = (PreparedStatement) connection.prepareStatement(sql);
            int l = stmt.executeUpdate();
            stmt.close();
            if (l > 0) {
                System.out.println("Foram alterados " + l + " linhas");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public void mudarStatusRealizado(int pedido, String horas) {
        String sql = "update pedido set pedStatus = 'Realizado', pedTimeF ='" + horas + "'  "
                + "where pedCodigo = " + pedido + ";";

        try {
            PreparedStatement stmt = (PreparedStatement) connection.prepareStatement(sql);
            int l = stmt.executeUpdate();
            stmt.close();
            if (l > 0) {
                System.out.println("Foram alterados " + l + " linhas");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public void excluir(int codigo, int excluzao) {
        String sql = "update pedido set ped_excCodigo = " + excluzao + " where pedCodigo = " + codigo + " ;";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

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

    /* public void excluirProduto(int venda, String motivo, int produto, String time) {
        String sql = "delete from pedido where ped_proCodigo = " + produto + " and ped_venCodigo = " + venda + " and pedTime = '" + time + "';";
        try {
            stmt = connection.prepareStatement(sql);
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }*/
    public int getMaxMesa(String u, String s) {
        int mesa = 0;
        String sql = "select max(venMesa) from empresa join caixa join venda where empCodigo = cai_empCodigo "
                + "   and caiCodigo = ven_caiCodigo and caiStatus = 'aberto' and venStatus = 'aberta' and empEmail = '" + u + "' and "
                + "   empSenha = '" + s + "';";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                mesa = rs.getInt(1);
            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return mesa;
    }

}
