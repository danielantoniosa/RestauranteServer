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

    public int adicionar(PedidoBEAN c) {
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
            stmt.setString(6, "Pendente");
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                i = rs.getInt(1);
            }
            stmt.close();
            return i;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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
            throw new RuntimeException();
        }
        return c;
    }*/
    public ArrayList<ProdutosGravados> produtosMesa(int mesa) {
        ArrayList<ProdutosGravados> c = new ArrayList<ProdutosGravados>();

        String sql = "SELECT pedCodigo,ped_proCodigo, proNome,pedQTD, pedTime,venMesa, (proPreco * pedQTD) "
                + "FROM produto join pedido join venda"
                + " where"
                + " venCodigo = ped_venCodigo and ped_proCodigo = proCodigo and venMesa=" + mesa + " and venStatus = 'aberta' and ped_excCodigo is null;";
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
                c.add(ca);
            }
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return c;
    }

    public ArrayList<Pedido> listarPedidosAbertos(int empresa, int caixa) {
        ArrayList<Pedido> c = new ArrayList<Pedido>();

        String sql = "SELECT pedCodigo,proNome,venMesa,pedQTD, pedTime,proPreparo,pedObs,pedTimeF\n"
                + "                FROM empresa join caixa join venda join pedido join produto\n"
                + "                where\n"
                + "                empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo and venCodigo = ped_venCodigo and ped_proCodigo = proCodigo\n"
                + "                and caiCodigo=" + caixa + " and empCodigo = " + empresa + " and  proTipo ='Cozinha' and pedStatus = 'Pendente' and venStatus = 'aberta' and ped_excCodigo is null;";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
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
            throw new RuntimeException();
        }
        return c;
    }

    public ArrayList<Pedido> listarPedidos(int empresa, int caixa) {
        ArrayList<Pedido> c = new ArrayList<Pedido>();

        String sql = "SELECT pedCodigo,proNome,venMesa,pedQTD, pedTime,proPreparo,pedObs,pedTimeF,pedStatus\n"
                + "                FROM empresa join caixa join venda join pedido join produto\n"
                + "                where\n"
                + "                empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo and venCodigo = ped_venCodigo and ped_proCodigo = proCodigo\n"
                + "                and caiCodigo=" + caixa + " and empCodigo = " + empresa + " and  proTipo ='Cozinha' and venStatus = 'aberta' and ped_excCodigo is null;";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
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
            throw new RuntimeException();
        }
        return c;
    }

    public ArrayList<Pedido> listarPedidosAtrazados(int empresa, int caixa) {
        ArrayList<Pedido> c = new ArrayList<Pedido>();

        String sql = "SELECT pedCodigo,proNome,venMesa,pedQTD, pedTime,proPreparo,pedObs,pedTimeF\n"
                + "                FROM empresa join caixa join venda join pedido join produto\n"
                + "                where\n"
                + "                empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo and venCodigo = ped_venCodigo and ped_proCodigo = proCodigo\n"
                + "                and caiCodigo=" + caixa + " and empCodigo = " + empresa + " and  proTipo ='Cozinha' and pedStatus = 'Atrazado' and venStatus = 'aberta' and ped_excCodigo is null;";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
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
            throw new RuntimeException();
        }
        return c;
    }

    public ArrayList<Pedido> listarPedidosRealizados(int empresa, int caixa) {
        ArrayList<Pedido> c = new ArrayList<Pedido>();

        String sql = "SELECT pedCodigo,proNome,venMesa,pedQTD, pedTime,proPreparo,pedObs,pedTimeF\n"
                + "                FROM empresa join caixa join venda join pedido join produto\n"
                + "                where\n"
                + "                empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo and venCodigo = ped_venCodigo and ped_proCodigo = proCodigo\n"
                + "                and caiCodigo=" + caixa + " and empCodigo = " + empresa + " and  proTipo ='Cozinha' and pedStatus = 'Realizado' and venStatus = 'aberta' and ped_excCodigo is null;";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
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
            throw new RuntimeException();
        }
        return c;
    }

    public PedidoBEAN localizar(int produto, int venda, String time) {
        PedidoBEAN ca = new PedidoBEAN();

        String sql = "select * from pedido where ped_proCodigo = " + produto + " and ped_venCondigo = " + venda + " and pedTime = '" + time + "' and ped_excCodigo is null;";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
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
            throw new RuntimeException();
        }
        return ca;
    }

    public void transferir(int pedido, int destino) {
        String sql = "update pedido set ped_venCodigo = " + destino + "  "
                + "where pedCodigo = " + pedido + " ;";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            int l = stmt.executeUpdate();
            stmt.close();
            if (l > 0) {
                System.out.println("Foram alterados " + l + " linhas");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void mudarStatusAtrazado(int pedido) {
        String sql = "update pedido set pedStatus = 'Atrazado'  "
                + "where pedCodigo = " + pedido + " ;";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            int l = stmt.executeUpdate();
            stmt.close();
            if (l > 0) {
                System.out.println("Foram alterados " + l + " linhas");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void mudarStatusRealizado(int pedido, String horas) {
        String sql = "update pedido set pedStatus = 'Realizado', pedTimeF ='" + horas + "'  "
                + "where pedCodigo = " + pedido + ";";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            int l = stmt.executeUpdate();
            stmt.close();
            if (l > 0) {
                System.out.println("Foram alterados " + l + " linhas");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void excluir(int codigo, int excluzao) {
        String sql = "update pedido set ped_excCodigo = " + excluzao + " where pedCodigo = " + codigo + " ;";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void transferirMesa(int origem, int destino) {
        String sql = "update pedido set ped_venCodigo = " + destino + "  where ped_venCodigo = " + origem + " ;";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            int l = stmt.executeUpdate();
            stmt.close();
            if (l > 0) {
                System.out.println("Foram alterados " + l + " linhas");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    /* public void excluirProduto(int venda, String motivo, int produto, String time) {
        String sql = "delete from pedido where ped_proCodigo = " + produto + " and ped_venCodigo = " + venda + " and pedTime = '" + time + "';";
        try {
            stmt = connection.prepareStatement(sql);
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }*/
    public int getMesaBalcaoAberta(int caixa) {
        int mesa = 0;
        String sql = "select venMesa from venda where ven_caiCodigo = " + caixa + " and venStatus = 'aberta' and venMesa > 100 ;";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                mesa = rs.getInt(1);

            }
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return mesa;
    }

    public int getMaxMesa(int caixa) {
        int mesa = 0;
        String sql = "select max(venMesa) from venda where ven_caiCodigo = " + caixa + ";";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                mesa = rs.getInt(1);

            }
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return mesa;
    }

}
