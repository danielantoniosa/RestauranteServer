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

    private static Connection connection;

    private static PreparedStatement stmt;

    public SharedPreferences() {
        this.connection = ConnectionFactory.getConnection();
    }

    public static void inserir(int cod) {
        String sql = "insert into sharedPreferences (empCodigo)values (?);";
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, cod);
            stmt.execute();
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static int listar() {
        int cod = 0;
        String sql = "select * from sharedPreferences ;";
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

    public static void excluir() {
        String sql = "delete from sharedPreferences ; ";
        try {
            stmt = connection.prepareStatement(sql);
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
