/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.persistencia;

import com.server.restauranteserver.beans.CaixaBEAN;
import com.server.restauranteserver.beans.EmpresaBEAN;
import com.server.restauranteserver.beans.SharedPreferencesEmpresaBEAN;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 *
 * @author Daniel
 */
public class EmpresaDAO {

    private Connection connection;

    private PreparedStatement stmt;

    public EmpresaDAO() {
        this.connection = ConnectionFactory.getConnection();
    }

    public String adcionar(EmpresaBEAN c) {
        String sql = "INSERT INTO empresa (empRazaoSocial,empNomeFantazia,empCNPJ,empInsEstadual,"
                + "empEmail,empTelefone,empSenha,empDataCadastro,empExpiraLicenca,empLogradouro,"
                + "empNumero,empBairro,empComplemento,empCidade,empUF,empCEP)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        try {
            stmt = connection.prepareStatement(sql);

            stmt.setString(1, c.getRazaoSocial());
            stmt.setString(2, c.getFantazia());
            stmt.setString(3, c.getCnpj());
            stmt.setString(4, c.getInscEstad());
            stmt.setString(5, c.getEmail());
            stmt.setString(6, c.getTelefone());
            stmt.setString(7, c.getSenha());
            stmt.setString(8, c.getDataCadastro());
            stmt.setString(9, c.getExpriraLicenca());
            stmt.setString(10, c.getLogradouro());
            stmt.setString(11, c.getNumero());
            stmt.setString(12, c.getBairro());
            stmt.setString(13, c.getComplemento());
            stmt.setString(14, c.getCidade());
            stmt.setString(15, c.getUf());
            stmt.setString(16, c.getCep());
            stmt.execute();
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "Sucesso!";

    }

    public EmpresaBEAN localizar(String email) {

        EmpresaBEAN e = new EmpresaBEAN();

        String sql = "select * from empresa where empEmail = " + email + ";";
        try {
            stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                e.setCodigo(rs.getInt(1));
                e.setRazaoSocial(rs.getString(2));;
                e.setFantazia(rs.getString(3));
                e.setCnpj(rs.getString(4));
                e.setInscEstad(rs.getString(5));
                e.setEmail(rs.getString(6));
                e.setTelefone(rs.getString(7));
                e.setSenha(rs.getString(8));
                e.setDataCadastro(rs.getString(9));
                e.setExpriraLicenca(rs.getString(10));
                e.setLogradouro(rs.getString(11));
                e.setNumero(rs.getString(12));
                e.setBairro(rs.getString(13));
                e.setComplemento(rs.getString(14));
                e.setCidade(rs.getString(15));
                e.setUf(rs.getString(16));
                e.setCep(rs.getString(17));
                e.setLogo(rs.getBytes(18));
                e.setDataFundacao(rs.getString(19));
                e.setTipo(rs.getString(20));

            }
            stmt.close();

        } catch (SQLException c) {
            throw new RuntimeException();
        }
        return e;
    }

    public SharedPreferencesEmpresaBEAN localizar(int cod) {
        SharedPreferencesEmpresaBEAN s = new SharedPreferencesEmpresaBEAN();
        s.setEmpCodigo(0);
        String sql = "select empCodigo,empEmail, empSenha,empLogo,empNomeFantazia from empresa where empCodigo = " + cod + ";";

        try {
            stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                s.setEmpCodigo(rs.getInt(1));
                s.setEmpEmail(rs.getString(2));
                s.setEmpSenha(rs.getString(3));
                s.setEmpLogo(rs.getBytes(4));
                s.setEmpFantazia(rs.getString(5));
            }
            stmt.close();
            return s;
        } catch (SQLException e) {
            throw new RuntimeException();
        }

    }

    public int login(String email, String senha) {
        int cod = 0;
        String sql = "select empCodigo from empresa where empEmail = '" + email + "' and empSenha = '" + senha + "';";
        System.out.println(sql);
        try {
            stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                cod = rs.getInt(1);

            }
            stmt.close();
            return cod;
        } catch (SQLException e) {
            throw new RuntimeException();
        }

    }
}
