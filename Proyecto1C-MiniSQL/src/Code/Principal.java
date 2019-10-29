/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Code;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Sthephan
 */
public class Principal {
    public static void main(String[] args) {
        String ruta = "C:/Users/Sthephan/Documents/GitHub/Proyect1Compi/Proyecto1C-MiniSQL/src/Code/Lexer.flex";
        String ruta2 = "C:/Users/Sthephan/Documents/GitHub/Proyect1Compi/Proyecto1C-MiniSQL/src/Code/LexerCup.flex";
        String[] rutaS = {"-parser", "Sintax", "C:/Users/Sthephan/Documents/GitHub/Proyect1Compi/Proyecto1C-MiniSQL/src/Code/Sintax.cup"};
        try {
            generar(ruta, ruta2, rutaS);
        } catch (Exception ex) {
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void generar(String ruta, String ruta2, String[] rutaS) throws IOException, Exception{
        File archivo;
        archivo = new File(ruta);
        jflex.Main.generate(archivo);
        archivo = new File(ruta2);
        jflex.Main.generate(archivo);
        java_cup.Main.main(rutaS);
        
        Path rutaSym = Paths.get("C:/Users/Sthephan/Documents/GitHub/Proyect1Compi/Proyecto1C-MiniSQL/src/Code/sym.java");
        if(Files.exists(rutaSym)){
            Files.delete(rutaSym);
        }
        Files.move(
                Paths.get("C:/Users/Sthephan/Documents/GitHub/Proyect1Compi/Proyecto1C-MiniSQL/sym.java"), 
                Paths.get("C:/Users/Sthephan/Documents/GitHub/Proyect1Compi/Proyecto1C-MiniSQL/src/Code/sym.java")
        );
        Path rutaSintax = Paths.get("C:/Users/Sthephan/Documents/GitHub/Proyect1Compi/Proyecto1C-MiniSQL/src/Code/Sintax.java");
        if(Files.exists(rutaSintax)){
            Files.delete(rutaSintax);
        }
        Files.move(
                Paths.get("C:/Users/Sthephan/Documents/GitHub/Proyect1Compi/Proyecto1C-MiniSQL/Sintax.java"), 
                Paths.get("C:/Users/Sthephan/Documents/GitHub/Proyect1Compi/Proyecto1C-MiniSQL/src/Code/Sintax.java")
        );
    }
}
