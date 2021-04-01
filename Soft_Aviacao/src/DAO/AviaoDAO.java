/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import JDBC.ConnectionFactory;
import Javabeans.Aviao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author h11hu
 */
public class AviaoDAO {
    
    private Connection conecta;

    public AviaoDAO() {
        this.conecta = new ConnectionFactory().conecta();
    }
    
    public void cadastrarAviao(Aviao a){
        try {
            String query = "insert into aviao(prefixo_aeronautico, idade, modelo, assentos, capacidade_tanque) values(?,?,?,?,?)";
            PreparedStatement stmt = conecta.prepareStatement(query);
            stmt.setString(1, a.getPrefixo_aeronautico());
            stmt.setInt(2, a.getIdade());
            stmt.setString(3, a.getModelo());
            stmt.setInt(4, a.getAssentos());
            stmt.setInt(5, a.getCapacidade_tanque());
            stmt.execute();
            stmt.close();
        } catch (SQLException erro) {
            throw new RuntimeException(erro);
        }
    }
    
    public List <String> read(){
        List<String> avioes = new ArrayList<>();
        Connection con = new ConnectionFactory().conecta();
        PreparedStatement stmt=null;
        ResultSet rs= null;
        try {
            stmt = con.prepareStatement("select prefixo_aeronautico from aviao");
            rs = stmt.executeQuery();
            while(rs.next()){
                avioes.add(rs.getString("prefixo_aeronautico"));
            }
            stmt.close();
        } catch (Exception e) {
            
        }
         
         return avioes;
    }
    
    
}
