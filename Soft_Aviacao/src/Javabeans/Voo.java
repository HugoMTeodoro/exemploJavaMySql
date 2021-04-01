/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Javabeans;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author h11hu
 */
public class Voo {
    
    String horario;
    String destino;
    String dia;
    int itinerario;
    int tripulacao;
    int id_voo;
    int count;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public void setId_voo(int id_voo) {
        this.id_voo = id_voo;
    }

    public int getId_voo() {
        return id_voo;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }
    String prefixo_aeronautico;

    public String getPrefixo_aeronautico() {
        return prefixo_aeronautico;
    }

    public void setPrefixo_aeronautico(String prefixo_aeronautico) {
        this.prefixo_aeronautico = prefixo_aeronautico;
    }

    public String getHorario() {
        return horario;
    }

    /**
     *
     * @param horario
     */
    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    /**
     *
     * @param dia
     */
    public int getItinerario() {
        return itinerario;
    }

    public void setItinerario(int itinerario) {
        this.itinerario = itinerario;
    }

    public int getTripulacao() {
        return tripulacao;
    }

    public void setTripulacao(int tripulacao) {
        this.tripulacao = tripulacao;
    }

}
