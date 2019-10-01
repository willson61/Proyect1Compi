/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Code;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sthephan
 */
public class SintaxisError {
    public List<TokenElement> tokensFaltantes;
    public TokenElement tokPrev;

    public List<TokenElement> getTokensFaltantes() {
        return tokensFaltantes;
    }

    public void setTokensFaltantes(List<TokenElement> tokensFaltantes) {
        this.tokensFaltantes = tokensFaltantes;
    }

    public TokenElement getTokPrev() {
        return tokPrev;
    }

    public void setTokPrev(TokenElement tokPrev) {
        this.tokPrev = tokPrev;
    }

    public SintaxisError(List<TokenElement> tokensFaltantes, TokenElement tokPrev) {
        if(tokensFaltantes != null){
            this.tokensFaltantes = new ArrayList();
            this.tokensFaltantes.addAll(tokensFaltantes);
        }
        this.tokPrev = tokPrev;
    }
    
    public String getMensaje(){
        StringBuilder stringB = new StringBuilder();
        stringB.append("Error en Sintaxis:");
        stringB.append("Empezando en: ");
        stringB.append(this.tokPrev.valor);
        stringB.append(", esperando: ");
        if(!tokensFaltantes.isEmpty()){
            stringB.append(tokensFaltantes.get(0).valor);
            stringB.append("/");
            stringB.append(tokensFaltantes.get(0).tok.toString());
            for (int i = 1; i < tokensFaltantes.size(); i++) {
                stringB.append(" OR ");
                stringB.append(tokensFaltantes.get(i).valor);
                stringB.append("/");
                stringB.append(tokensFaltantes.get(i).tok.toString());
            }
        }
        stringB.append(", en Linea: ");
        stringB.append(this.tokPrev.getNumLinea() + 1);
        stringB.append(", y en posicion inicial: ");
        stringB.append(this.tokPrev.getPosInicial());
        return stringB.toString();
    }
    
    
    
    
}
