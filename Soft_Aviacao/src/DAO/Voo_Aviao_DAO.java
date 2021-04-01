/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import JDBC.ConnectionFactory;
import Javabeans.Aviao_Voo;
import Javabeans.Voo;
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
public class Voo_Aviao_DAO {
    
    private Connection conecta;

    public Voo_Aviao_DAO() {
        this.conecta = new ConnectionFactory().conecta();
    }
    
     public List<Aviao_Voo> listarVoos(String p) {
        List<Aviao_Voo> lista = new ArrayList<>();
        try {
            String query = "SELECT * FROM voo INNER JOIN aviao where voo.prefixo_aeronautico = ? and aviao.prefixo_aeronautico=?";
            PreparedStatement stmt = conecta.prepareStatement(query);
            stmt.setString(1, p);
            stmt.setString(2, p);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Aviao_Voo v = new Aviao_Voo();
                v.setDestino(rs.getString("destino"));
                v.setItinerario(rs.getInt("id_itinerario"));
                v.setTripulacao(rs.getInt("id_tripulacao"));
                v.setId_voo(rs.getInt("id_voo"));
                v.setDia(rs.getString("dia"));
                v.setHorario(rs.getString("horario"));
                v.setPrefixo_aeronautico(rs.getString("prefixo_aeronautico"));
                v.setIdade(rs.getInt("idade"));
                v.setModelo(rs.getString("modelo"));
                v.setAssentos(rs.getInt("assentos"));
                v.setCapacidade_tanque(rs.getInt("capacidade_tanque"));
                lista.add(v);

            }
            return lista;
        } catch (SQLException erro) {
            throw new RuntimeException(erro);
        }
    }
    
}
