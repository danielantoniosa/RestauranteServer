/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.persistencia;

import com.server.restauranteserver.beans.ProdutoBEAN;
import com.server.restauranteserver.beans.Produtos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Daniel
 */
public class ProdutoDAO {

    private Connection connection;

    public ProdutoDAO() {
        this.connection = ConnectionFactory.getConnection();
    }

    public ArrayList<Produtos> buscar(String produto, int emp) {

        ArrayList<Produtos> p = new ArrayList<>();
        String sql = "SELECT proCodigo,proNome, proPreco FROM produto WHERE pro_empCodigo = " + emp + " and (proCodigo LIKE '" + produto + "%' or proNome LIKE '" + produto + "%');";
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Produtos pp = new Produtos();
                pp.setCodigo(rs.getInt(1));
                pp.setNome(rs.getString(2));
                pp.setPreco(rs.getFloat(3));
                p.add(pp);
                // modelo.addElement(rs.getInt(1) + " : " + rs.getString(2) + String.format("%80s"," R$ " + rs.getFloat(3)+""));
            }
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException();
        }

        return p;

    }

    public boolean adicionar(ProdutoBEAN c, int emp) {
        String sql = "INSERT INTO produto (proNome, proPreco, proCusto,proQuantidade, proDescricao, proArmonizacao,"
                + "proPreparo,proTipo,proFoto,pro_empCodigo)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, c.getNome());
            stmt.setFloat(2, c.getPreco());
            stmt.setFloat(3, c.getCusto());
            stmt.setFloat(4, c.getQuantidade());
            stmt.setString(5, c.getDescricao());
            stmt.setString(6, c.getArmonizacao());
            stmt.setString(7, c.getPreparo());
            stmt.setString(8, c.getTipo());
            stmt.setBytes(9, c.getFoto());
            stmt.setInt(10, emp);
            stmt.execute();
            stmt.close();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<ProdutoBEAN> listarALl(int emp) {
        ArrayList<ProdutoBEAN> c = new ArrayList<ProdutoBEAN>();

        String sql = "select * from produto where pro_empCodigo  = " + emp + ";";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ProdutoBEAN ca = new ProdutoBEAN();
                ca.setCodigo(rs.getInt(1));
                ca.setNome(rs.getString(2));
                ca.setPreco(rs.getFloat(3));
                ca.setCusto(rs.getFloat(4));
                ca.setQuantidade(rs.getFloat(5));
                ca.setArmonizacao(rs.getString(6));
                ca.setFoto(rs.getBytes(7));
                ca.setPreparo(rs.getString(8));
                ca.setDescricao(rs.getString(9));
                ca.setTipo(rs.getString(10));
                ca.setEmpresa(rs.getInt(14));
                c.add(ca);
            }
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return c;
    }

    public ProdutoBEAN localizar(int produto) {
        ProdutoBEAN ca = new ProdutoBEAN();

        String sql = "select * from produto where proCodigo = " + produto + ";";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ca.setCodigo(rs.getInt(1));
                ca.setNome(rs.getString(2));
                ca.setPreco(rs.getFloat(3));
                ca.setCusto(rs.getFloat(4));
                ca.setQuantidade(rs.getFloat(5));
                ca.setArmonizacao(rs.getString(6));
                ca.setFoto(rs.getBytes(7));
                ca.setPreparo(rs.getString(8));
                ca.setDescricao(rs.getString(9));
                ca.setTipo(rs.getString(10));
            }
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return ca;
    }

    public ProdutoBEAN localizar(String produto, int emp) {
        ProdutoBEAN ca = new ProdutoBEAN();
        ca.setCodigo(0);
        String sql = "select * from produto where proNome = '" + produto + "' and pro_empCodigo = " + emp + ";";
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ca.setCodigo(rs.getInt(1));
                ca.setNome(rs.getString(2));
                ca.setPreco(rs.getFloat(3));
                ca.setCusto(rs.getFloat(4));
                ca.setQuantidade(rs.getFloat(5));
                ca.setArmonizacao(rs.getString(6));
                ca.setFoto(rs.getBytes(7));
                ca.setPreparo(rs.getString(8));
                ca.setDescricao(rs.getString(9));
                ca.setTipo(rs.getString(10));
            }
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return ca;
    }

    public void editar(ProdutoBEAN c) {
        String sql = "update produto set proNome = ? , proPreco = ? , proCusto = ? , proQuantidade = ?, proDescricao = ?, proArmonizacao = ?"
                + ", proPreparo = ? , proTipo = ?, proFoto = ? where proCodigo = " + c.getCodigo() + ";";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, c.getNome());
            stmt.setFloat(2, c.getPreco());
            stmt.setFloat(3, c.getCusto());
            stmt.setFloat(4, c.getQuantidade());
            stmt.setString(5, c.getDescricao());
            stmt.setString(6, c.getArmonizacao());
            stmt.setString(7, c.getPreparo());
            stmt.setString(8, c.getTipo());
            stmt.setBytes(9, c.getFoto());

            int l = stmt.executeUpdate();
            stmt.close();
            if (l > 0) {
                System.out.println("Foram alterados " + l + " linhas");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void alteraQuantidade(int pro, float qtd) {
        String sql = "update produto set proQuantidade = ? where proCodigo = " + pro + ";";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setFloat(1, qtd);

            int l = stmt.executeUpdate();
            stmt.close();
            if (l > 0) {
                System.out.println("Foram alterados " + l + " linhas");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public ArrayList<Produtos> listarProdutos(int emp) {
        ArrayList<Produtos> c = new ArrayList<Produtos>();

        String sql = "select * from produto where pro_empCodigo = " + emp + ";";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Produtos ca = new Produtos();
                ca.setCodigo(rs.getInt(1));
                ca.setNome(rs.getString(2));
                ca.setPreco(rs.getFloat(3));
                ca.setDescricao(rs.getString(9));
                ca.setTipo(rs.getString(10));
                c.add(ca);
            }
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return c;
    }

    public void excluir(int cod) {
        String sql = "delete from produto where proCodigo = ? ";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, cod);
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public float quantidadeEstoque(int produto) {
        String sql = "select proQuantidade from produto where proTipo != 'Cozinha' and proCodigo = " + produto + ";";
        float quantidade = -1;
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                quantidade = rs.getFloat(1);

            }
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return quantidade;
    }

}
