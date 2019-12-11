/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VO;

/**
 *
 * @author APRENDIZ
 */
public class UsuarioVO {
    private String usuario;
    private String contraseña;
    private String Estado;

    public UsuarioVO(String usuario, String contraseña) {
        this.usuario = usuario;
        this.contraseña = contraseña;
    }

    public UsuarioVO(String usuario, String contraseña, String Estado) {
        this.usuario = usuario;
        this.contraseña = contraseña;
        this.Estado = Estado;
    }
    
    
    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }
    
    
    
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }
    
    
    public UsuarioVO(){
        
    }

    public UsuarioVO(String usuario) {
        this.usuario = usuario;
    }
    
}
