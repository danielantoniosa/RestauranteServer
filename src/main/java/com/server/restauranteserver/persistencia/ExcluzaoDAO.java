/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.persistencia;

import com.server.restauranteserver.beans.ExcluzaoBEAN;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.server.restauranteserver.persistencia.ConnectionFactory;
import java.sql.Statement;

/**
 *
 * @author Daniel
 */
public class ExcluzaoDAO {

    private Connection connection;

    public ExcluzaoDAO() {
        this.connection = ConnectionFactory.getConnection();
    }

    public int inserir(ExcluzaoBEAN c) {
        int lastId = 0;
        String sql = "INSERT INTO exclusao (excMotivo , excTime, exc_funCodigo)"
                + " VALUES (?, ?, ?);";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, c.getMotivo());
            stmt.setString(2, c.getTime());
            stmt.setInt(3, c.getFuncionario());
            stmt.executeUpdate();
            final ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                lastId = rs.getInt(1);
            }

            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lastId;
    }

    public ArrayList<ExcluzaoBEAN> listarExclusaoMesa(int mesa) {
        ArrayList<ExcluzaoBEAN> c = new ArrayList<>();

        String sql = "select excCodigo,excMotivo , excTime, funNome\n"
                + "	from empresa join admicao join funcionario join exclusao join pedido join venda\n"
                + "	where empCodigo = adm_empCodigo and funCodigo = adm_funCdoigo and "
                + "     funCodigo = exc_funCodigo and ped_excCodigo = excCodigo and venCodigo = ped_venCodigo and"
                + "     venMesa ='" + mesa + "' and caiStatus = 'aberto' and venStatus = 'aberta'\n"
                + "			group by venCodigo \n"
                + "				order by venMesa;";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ExcluzaoBEAN e = new ExcluzaoBEAN();
                e.setCodigo(rs.getInt(1));
                e.setMotivo(rs.getString(2));
                e.setTime(rs.getString(3));
                e.setFuncionarioN(rs.getString(4));
                c.add(e);
            }
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return c;
    }

    public ExcluzaoBEAN listarUm(String cod) {
        ExcluzaoBEAN e = new ExcluzaoBEAN();
        System.out.println("Codigo " + cod);
        String sql = "select * from exclusao where "
                + " excCodigo = " + cod + ";";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                e.setCodigo(rs.getInt(1));
                e.setMotivo(rs.getString(2));
                e.setTime(rs.getString(3));
                e.setFuncionario(rs.getInt(4));
            }
            stmt.close();

        } catch (SQLException er) {
            throw new RuntimeException();
        }
        return e;
    }

    public ArrayList<ExcluzaoBEAN> listarExclusaoCaixa(String u, String s) {
        ArrayList<ExcluzaoBEAN> c = new ArrayList<>();

        String sql = "select excCodigo,excMotivo,excTime,exc_funCodigo,funNome "
                + "   from  empresa join caixa join venda join pedido join exclusao join funcionario \n"
                + "   where empCodigo = cai_empCodigo and ped_venCodigo= venCodigo and excCodigo = ped_excCodigo and exc_funCodigo = funCodigo and ven_caiCodigo = caiCodigo and\n"
                + "   empEmail = '" + u + "' and empSenha = '" + s + "' order by excTime;";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ExcluzaoBEAN e = new ExcluzaoBEAN();
                e.setCodigo(rs.getInt(1));
                e.setMotivo(rs.getString(2));
                e.setTime(rs.getString(3));
                e.setFuncionario(rs.getInt(4));
                e.setFuncionarioN(rs.getString(5));
                c.add(e);
            }
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return c;
    }

}
