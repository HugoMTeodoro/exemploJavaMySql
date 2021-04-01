/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soft_aviação;

import java.sql.Connection;
import javax.swing.JOptionPane;

/**
 *
 * @author h11hu
 */
public class Soft_Aviação {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            JOptionPane.showMessageDialog(null, "Testando");
            Connection con = new JDBC.ConnectionFactory().conecta();
            JOptionPane.showMessageDialog(null, "Deu certo");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Deu errado"+e);
        }
    }
    
}
