/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author h11hu
 */
public class ConnectionFactory {

    public Connection conecta() {
        try {
            return DriverManager.getConnection("jdbc:mysql://localhost/db_avicao", "root", "");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
