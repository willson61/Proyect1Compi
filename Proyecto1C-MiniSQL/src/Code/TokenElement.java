/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Code;

/**
 *
 * @author Sthephan
 */
public class TokenElement {
    public int ID;
    public int numLinea;
    public int posInicial;
    public int posFinal;
    public String valor;
    public Tokens tok;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getNumLinea() {
        return numLinea;
    }

    public void setNumLinea(int numLinea) {
        this.numLinea = numLinea;
    }

    public int getPosInicial() {
        return posInicial;
    }

    public void setPosInicial(int posInicial) {
        this.posInicial = posInicial;
    }

    public int getPosFinal() {
        return posFinal;
    }

    public void setPosFinal(int posFinal) {
        this.posFinal = posFinal;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public Tokens getTok() {
        return tok;
    }

    public void setTok(Tokens tok) {
        this.tok = tok;
    }

    public TokenElement() {
    }
    
    public TokenElement(String valor, Tokens tok) {
        this.valor = valor;
        this.tok = tok;
    }

    public TokenElement(int ID, int numLinea, int posInicial, int posFinal, String valor, Tokens tok) {
        this.ID = ID;
        this.numLinea = numLinea;
        this.posInicial = posInicial;
        this.posFinal = posFinal;
        this.valor = valor;
        this.tok = tok;
    }
    
    
    
    public static TokenElement TokFromText(String texto){
        TokenElement tok = new TokenElement();
        if(texto.contains("Es un")){
            String elementos1[] = texto.split(":");
            String elementos2[] = texto.split(":|,");
            if(elementos1[0].equals(",")){
                elementos2 = texto.substring(1).split(":|,");
            }
            tok.setValor(elementos1[0]); 
            tok.setTok(getTokenFromName(elementos2[1].replace(" Es un ", "")));
            tok.setNumLinea(Integer.parseInt(elementos2[3].trim()));
            tok.setPosInicial(Integer.parseInt(elementos2[5].trim()));
            tok.setPosFinal(Integer.parseInt(elementos2[7].trim()));
        }
        return tok;
    }
    
    public static Tokens getTokenFromName(String nombre){
        Tokens tok;
        switch(nombre){
            case "Reservada": tok = Tokens.Reservada; break;
            case "Identificador": tok = Tokens.Identificador; break;
            case "Bit": tok = Tokens.Bit; break;
            case "Operador": tok = Tokens.Operador; break;
            case "Constante": tok = Tokens.Constante; break;
            case "Integer": tok = Tokens.Integer; break;
            case "Float": tok = Tokens.Float; break;
            case "Varchar": tok = Tokens.Varchar; break;
            case "VarcharError": tok = Tokens.VarcharError; break;
            case "Comentario": tok = Tokens.Comentario; break;
            case "Espacios": tok = Tokens.Espacios; break;
            case "ComentarioError": tok = Tokens.ComentarioError; break;
            case "ERROR": tok = Tokens.ERROR; break;
            case "DatoEntero": tok = Tokens.DatoEntero; break;
            case "DatoBit": tok = Tokens.DatoBit; break;
            case "DatoDecimal": tok = Tokens.DatoDecimal; break;
            case "DatoFechaHora": tok = Tokens.DatoFechaHora; break;
            case "DatoTexto": tok = Tokens.DatoTexto; break;
            case "DatoBin": tok = Tokens.DatoBin; break;
            case "OperadorBooleano": tok = Tokens.OperadorBooleano; break;
            default: tok = null; break;
        }
        return tok;
    }
    
    public boolean evaluarToken(Tokens tok, String valor){
        if(valor == null || valor.isEmpty()){
            return this.tok == tok;
        }
        return this.tok == tok && this.valor.toUpperCase().equals(valor.toUpperCase());
    }
}
