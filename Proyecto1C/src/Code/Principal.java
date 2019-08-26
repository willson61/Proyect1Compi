/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Code;

import java.io.File;
/**
 *
 * @author Sthephan
 */
public class Principal {
    public static void main(String[] args) {
        String ruta = "C:/Users/Sthephan/Documents/GitHub/Proyect1Compi/Proyecto1C/src/Code/Lexer.flex";
        generarLexer(ruta);
    }
    
    public static void generarLexer(String ruta){
        File archivo = new File(ruta);
        jflex.Main.generate(archivo);
    }
}
