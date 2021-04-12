/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.persistencia;

import com.server.restauranteserver.beans.Caixa;
import com.server.restauranteserver.beans.CaixaBEAN;
import com.server.restauranteserver.util.Time;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Daniel
 */
public class CaixaDAO {

    private Connection connection;

    public CaixaDAO() {
        this.connection = ConnectionFactory.getConnection();
    }

    public boolean abrirCaixa(CaixaBEAN c, String u, String s) {
        String sql = "insert into caixa (caiData,caiIn,caiTrocoIn,caiStatus,cai_empCodigo) values (?,?,?,?,"
                + "(select empCodigo from empresa where empEmail = '" + u + "' and empSenha = '" + s + "'))";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, c.getData());
            stmt.setString(2, c.getIn());
            stmt.setFloat(3, c.getTrocoIn());
            stmt.setString(4, "aberto");
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return true;
    }

    public CaixaBEAN listar(String u, String s) {

        CaixaBEAN ca = new CaixaBEAN();
        ca.setCodigo(0);
        String sql = "select * from caixa join empresa where caiStatus = 'aberto' and empCodigo = cai_empCodigo and empEmail = '" + u + "' and empSenha = '" + s + "';";
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ca.setCodigo(rs.getInt(1));
                ca.setData(Time.formataDataBR(rs.getDate(2) + ""));
                ca.setIn(rs.getString(3));
                ca.setOut(rs.getString(4));
                ca.setTrocoIn(rs.getFloat(5));
                ca.setTrocoFin(rs.getFloat(6));
                ca.setStatus(rs.getString(7));

            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return ca;
    }

    public void fecharCaixa(Float troco, String hora, String u, String s) {
        String sql = "update empresa join caixa set caiOut = ? , caiTrocoFin = ? , caiStatus = ? where empCodigo = cai_empCodigo and caiStatus = 'aberto' "
                + "and empCodigo = cai_empCodigo and empEmail = '" + u + "' and empSenha = '" + s + "';";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setString(1, hora);
            stmt.setFloat(2, troco);
            stmt.setString(3, "fechado");
            int l = stmt.executeUpdate();
            stmt.close();
            if (l > 0) {
                System.out.println("Foram alterados " + l + " linhas");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public float getSaldoAtual(String u, String s) {
        float saldo = 0;
        String sql = "select	round(((COALESCE(sum(venValor) ,0)+ caiTrocoIn) -"
                + "((select COALESCE(sum(disPreco),0) from empresa join caixa join despesa where empCodigo = cai_empCodigo and"
                + "     caiCodigo = dis_caiCodigo and and empEmail = '" + u + "' and empSenha = '" + s + "') "
                + "         +(select COALESCE(sum(sanValor),0) as sangria from empresa join caixa join sangria where empCodigo = cai_empCodigo and "
                + "             caiCodigo = san_caiCodigo and empEmail = '" + u + "' and empSenha = '" + s + "')"
                + ")"
                + "),2) as Saldo from empresa join caixa join venda where empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo and venStatus = 'fechada'"
                + " and empEmail = '" + u + "' and empSenha = '" + s + "';";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                saldo = rs.getFloat(1);
            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return saldo;
    }

    public float getTotalVendido(String u, String s) {

        float saldo = 0;
        String sql = "select round(COALESCE(sum(venValor)),2) as Vendas\n"
                + " from empresa join caixa join venda where empCodigo = cai_empCodigo and"
                + " caiCodigo = ven_caiCodigo and venStatus = 'fechada' and empEmail = '" + u + "' and empSenha = '" + s + "';";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                saldo = rs.getFloat(1);
            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return saldo;
    }

    public Caixa getValoresCaixa(String emai, String senha) {
        String sql = "select caiCodigo as cai,empCodigo as emp,\n"
                + "                           (select COALESCE(sum(disPreco),0) from despesa join caixa join empresa where dis_caiCodigo = disCodigo and empCodigo = cai_empCodigo and empCodigo = emp ) as des,\n"
                + "                             (SELECT COALESCE(sum(sanValor),0) FROM sangria join caixa join empresa where san_caiCodigo = sanCodigo and empCodigo = cai_empCodigo and empCodigo = emp ) as san,\n"
                + "                                (select	 round(COALESCE(sum(venValor-venDesconto)),2) as Vendas\n"
                + "                               from empresa join caixa join venda where empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo and \n"
                + "                           venStatus = 'Fechada' and caiStatus = 'aberto' and empCodigo = emp) as faturamento,\n"
                + "                           (caiTrocoIn+(select	 round(COALESCE(sum(venValor-venDesconto)),2) as Vendas\n"
                + "                               from empresa join caixa join venda where empCodigo = cai_empCodigo and caiCodigo = ven_caiCodigo and \n"
                + "                           venStatus = 'Fechada' and caiStatus = 'aberto' and empCodigo = emp)-(select COALESCE(sum(disPreco),0) from despesa join caixa join empresa where dis_caiCodigo = disCodigo and empCodigo = cai_empCodigo and empCodigo = emp )-\n"
                + "                           (SELECT COALESCE(sum(sanValor),0) FROM sangria join caixa join empresa where san_caiCodigo = sanCodigo and empCodigo = cai_empCodigo and empCodigo = emp )) as saldo\n"
                + "                            FROM empresa join caixa where empCodigo = cai_empCodigo and caiStatus='aberto' and empEmail = '" + emai + "' and empSenha = '" + senha + "' ;";

        Caixa c = new Caixa();

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                c.setCaixa(rs.getInt(1));
                c.setDespesas(rs.getFloat(3));
                c.setSangria(rs.getFloat(4));
                c.setFaturamento(rs.getFloat(5));
                c.setSaldo(rs.getFloat(6));

            }
            stmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return c;
    }
}
