/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import JDBC.ConnectionFactory;
import Javabeans.Passageiro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author h11hu
 */
public class PassageiroDAO {
    
    private Connection conecta;

    public PassageiroDAO() {
        this.conecta = new ConnectionFactory().conecta();
    }
    
    public void cadastrarPassageiro(Passageiro p){
        try {
            String query = "insert into passageiro(nome,cpf,idade,passaporte) values(?,?,?,?)";
            PreparedStatement stmt = conecta.prepareStatement(query);
            stmt.setString(1, p.getNome());
            stmt.setString(2, p.getCpf());
            stmt.setInt(3, p.getIdade());
            stmt.setString(4, p.getPassaporte());
            stmt.execute();
            stmt.close();
        } catch (SQLException erro) {
            throw new RuntimeException(erro);
        }
    }
    
}
