/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function validacion(){
    valor = document.getElementById("cedula").value;
    if( !(/^\d{9}$/.test(valor)) ) {
      return false;
      rta = document.getElementById("respuesta");
      rta.classList.remove("d-none");
    }
}