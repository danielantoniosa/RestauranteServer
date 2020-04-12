/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.persistencia;

import com.server.restauranteserver.beans.CaixaBEAN;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Daniel
 */
public class SharedPreferences {

    private Connection connection;

    public SharedPreferences() {
        this.connection = ConnectionFactory.getConnection();
    }

    public void inserir(int cod) {
        String sql = "insert into shared_preferences (empCodigo)values (?);";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, cod);
            stmt.execute();
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int listar() {
        PreparedStatement stmt;
        int cod = 0;
        String sql = "select * from shared_preferences ;";
        try {
            stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                cod = rs.getInt(1);
            }
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return cod;
    }

    public void excluir() {
        String sql = "delete from shared_preferences where empCodigo > 0;";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
