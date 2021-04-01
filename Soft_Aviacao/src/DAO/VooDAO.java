/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import JDBC.ConnectionFactory;
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
public class VooDAO {

    private Connection conecta;

    public VooDAO() {
        this.conecta = new ConnectionFactory().conecta();
    }

    public void cadastrarVoo(Voo v) {
        try {
            String query = "insert into voo(destino, prefixo_aeronautico, id_itinerario, id_tripulacao, horario, dia) values(?,?,?,?,?,?)";
            PreparedStatement stmt = conecta.prepareStatement(query);
            //stmt.setDate(1, java.sql.Date.valueOf.getHorario());
            stmt.setString(1, v.getDestino());
            stmt.setString(2, v.getPrefixo_aeronautico());
            //stmt.setDate(4, java.sql.Date.valueOf(v.getDia()));
            stmt.setInt(3, v.getItinerario());
            stmt.setInt(4, v.getTripulacao());
            stmt.setString(5, v.getHorario());
            stmt.setString(6, v.getDia());
            stmt.execute();
            stmt.close();
        } catch (SQLException erro) {
            throw new RuntimeException(erro);
        }
    }

    public List<Voo> listarVoos() {
        List<Voo> lista = new ArrayList<>();
        try {
            String query = "select * from voo";
            PreparedStatement stmt = conecta.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Voo v = new Voo();
                v.setDestino(rs.getString("destino"));
                v.setItinerario(rs.getInt("id_itinerario"));
                v.setTripulacao(rs.getInt("id_tripulacao"));
                v.setPrefixo_aeronautico(rs.getString("prefixo_aeronautico"));
                v.setId_voo(rs.getInt("id_voo"));
                v.setDia(rs.getString("dia"));
                v.setHorario(rs.getString("horario"));
                lista.add(v);

            }
            return lista;
        } catch (SQLException erro) {
            throw new RuntimeException(erro);
        }
    }

    public void editarVoo(Voo v) {
        try {
            String query = "update voo set destino=?, prefixo_aeronautico=?, id_itinerario=?, id_tripulacao=?,horario=?,dia=? where id_voo=?";
            PreparedStatement stmt = conecta.prepareStatement(query);
            //stmt.setDate(1, java.sql.Date.valueOf.getHorario());
            stmt.setString(1, v.getDestino());
            stmt.setString(2, v.getPrefixo_aeronautico());
            //stmt.setDate(4, java.sql.Date.valueOf(v.getDia()));
            stmt.setInt(3, v.getItinerario());
            stmt.setInt(4, v.getTripulacao());
            stmt.setString(5, v.getHorario());
            stmt.setString(6, v.getDia());
            stmt.setInt(7, v.getId_voo());
            stmt.execute();
            stmt.close();
        } catch (SQLException erro) {
            throw new RuntimeException(erro);
        }
    }

    public void excluirVoo(int v) {
        try {
            String query = "delete from voo where id_voo=?";
            PreparedStatement stmt = conecta.prepareStatement(query);
            //stmt.setDate(1, java.sql.Date.valueOf.getHorario());
            stmt.setInt(1, v);
            stmt.execute();
            stmt.close();
        } catch (SQLException erro) {
            throw new RuntimeException(erro);
        }
    }
    
    public void excluirVoo(String v) {
        try {
            String query = "delete from voo where prefixo_aeronautico=?";
            PreparedStatement stmt = conecta.prepareStatement(query);
            //stmt.setDate(1, java.sql.Date.valueOf.getHorario());
            stmt.setString(1, v);
            stmt.execute();
            stmt.close();
        } catch (SQLException erro) {
            throw new RuntimeException(erro);
        }
    }

    public List<Voo> PesquisarVoos() {
        List<Voo> lista = new ArrayList<>();
        try {
            String query = "select * from voo where horario like ? and destino like ? and prefixo_aeronautico like ? and dia like ? and id_itinerario like ? and id_tripulacao like ?";
            PreparedStatement stmt = conecta.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Voo v = new Voo();
                v.setDestino(rs.getString("destino"));
                v.setItinerario(rs.getInt("id_itinerario"));
                v.setTripulacao(rs.getInt("id_tripulacao"));
                v.setPrefixo_aeronautico(rs.getString("prefixo_aeronautico"));
                v.setId_voo(rs.getInt("id_voo"));
                v.setDia(rs.getString("dia"));
                v.setHorario(rs.getString("horario"));
                lista.add(v);

            }
            return lista;
        } catch (SQLException erro) {
            throw new RuntimeException(erro);
        }
    }

    public List<Voo> gbVoos() {
        List<Voo> lista = new ArrayList<>();
        Connection con = new ConnectionFactory().conecta();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            
            stmt = con.prepareStatement("SELECT COUNT(prefixo_aeronautico), destino FROM voo GROUP BY destino order by destino");
            rs = stmt.executeQuery();
            while (rs.next()) {
                Voo v = new Voo();
                v.setCount(rs.getInt("COUNT(prefixo_aeronautico)"));
                v.setDestino(rs.getString("destino"));
                lista.add(v);
            }
            return lista;
        } catch (SQLException erro) {
            throw new RuntimeException(erro);
        }

        
    }

}
