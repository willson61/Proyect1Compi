/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Code;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.RandomAccessFile;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.filechooser.FileNameExtensionFilter;

/**
 *
 * @author Sthephan
 */
public class Analizador extends javax.swing.JFrame {

    /**
     * Creates new form Analizador
     */
    public Analizador() {
        initComponents();
        this.setLocationRelativeTo(this);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        lblRutaEntrada = new javax.swing.JLabel();
        btnEntrada = new javax.swing.JButton();
        btnAnalizar = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        lblRutaEntrada.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N

        btnEntrada.setText("Buscar Entrada");
        btnEntrada.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEntradaActionPerformed(evt);
            }
        });

        btnAnalizar.setText("Analizar Entrada");
        btnAnalizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAnalizarActionPerformed(evt);
            }
        });

        jButton1.setText("Borrar Entrada");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(btnEntrada)
                        .addGap(18, 18, 18)
                        .addComponent(jButton1))
                    .addComponent(lblRutaEntrada)
                    .addComponent(btnAnalizar))
                .addContainerGap(164, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(17, 17, 17)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnEntrada)
                    .addComponent(jButton1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(lblRutaEntrada)
                .addGap(43, 43, 43)
                .addComponent(btnAnalizar)
                .addContainerGap(188, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnEntradaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEntradaActionPerformed
        JFileChooser dialogo = new JFileChooser();
        FileNameExtensionFilter filtro = new FileNameExtensionFilter("Archivo de Texto", "txt");
        File ficheroImagen;
        String rutaArchivo;
        dialogo.setFileFilter(filtro);
        int valor = dialogo.showOpenDialog(this);
        if (valor == JFileChooser.APPROVE_OPTION) 
        {
            ficheroImagen = dialogo.getSelectedFile();
            rutaArchivo = ficheroImagen.getPath();
            lblRutaEntrada.setText(rutaArchivo);
        }
    }//GEN-LAST:event_btnEntradaActionPerformed

    private void btnAnalizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAnalizarActionPerformed
        String resultado = "";
        boolean estado = true;
        try {
            int lenghtToken = 0;
            int posInicial = 0;
            int posFinal = 0;
            int numLinea = 0;
            File entrada = new File(lblRutaEntrada.getText());
            Reader lector = new BufferedReader(new FileReader(lblRutaEntrada.getText()));
            RandomAccessFile ran = new RandomAccessFile(lblRutaEntrada.getText(), "r");
            Lexer lexer = new Lexer(lector);
            while (estado) {
                Tokens tokens = lexer.yylex();
                if (tokens == null) {
                    resultado += "FIN";
                    estado = false;
                }
                else{
                    lenghtToken = lexer.yylength();
                    posFinal = posFinal + lenghtToken;
                    switch (tokens) {
                        case ERROR:
                            resultado += "Simbolo no definido\n";
                            break;
                        case Identificador:
                            resultado += lexer.lexeme + ": Es un " + tokens + ", Linea: " + numLinea + " , Posicion Inicial: " + posInicial + " , Posicion Final: " + posFinal + "\n";
                            break;
                        case Reservada:
                            resultado += lexer.lexeme + ": Es un " + tokens + ", Linea: " + numLinea + " , Posicion Inicial: " + posInicial + " , Posicion Final: " + posFinal + "\n";
                            break;
                        case Boolean:
                            resultado += lexer.lexeme + ": Es un " + tokens + ", Linea: " + numLinea + " , Posicion Inicial: " + posInicial + " , Posicion Final: " + posFinal + "\n";
                            break;
                        case Operador:
                            resultado += lexer.lexeme + ": Es un " + tokens + ", Linea: " + numLinea + " , Posicion Inicial: " + posInicial + " , Posicion Final: " + posFinal + "\n";
                            break;
                        case Constante:
                            resultado += lexer.lexeme + ": Es un " + tokens + ", Linea: " + numLinea + " , Posicion Inicial: " + posInicial + " , Posicion Final: " + posFinal + "\n";
                            break;
                        case Comentario:
                            resultado += lexer.lexeme + ": Es un " + tokens + ", Linea: " + numLinea + " , Posicion Inicial: " + posInicial + " , Posicion Final: " + posFinal + "\n";
                            break;
                    }
                    posInicial = posFinal + 1;
                }
            }
            ran.close();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Analizador.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Analizador.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        File archivo = new File("C:/Users/Sthephan/Documents/GitHub/Proyect1Compi/archivo.out");
        PrintWriter writer;
        try {
            if(archivo.exists() == false){
                archivo.createNewFile();
            }
            else{
                writer = new PrintWriter(archivo);
                writer.print("");
                writer.close();
            }
        } catch (IOException ex) {
            Logger.getLogger(Analizador.class.getName()).log(Level.SEVERE, null, ex);
        }
        PrintWriter escribir;
        try {
            escribir = new PrintWriter(archivo);
            escribir.print(resultado);
            escribir.close();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Analizador.class.getName()).log(Level.SEVERE, null, ex);
        }
        JOptionPane.showMessageDialog(null, "InfoBox: " + "Analisis Completo", "Estado", JOptionPane.INFORMATION_MESSAGE);
        
    }//GEN-LAST:event_btnAnalizarActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Analizador.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Analizador.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Analizador.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Analizador.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Analizador().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAnalizar;
    private javax.swing.JButton btnEntrada;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel lblRutaEntrada;
    // End of variables declaration//GEN-END:variables
}
