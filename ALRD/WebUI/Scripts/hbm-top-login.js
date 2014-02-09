/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){    
    $(document).on("click","#loginFrmKey",function(ev){
        ev.preventDefault();
        // Visible Login Form;
        $(this).find("span").toggleClass("on");
        $("#loginFrm").toggleClass("open");
    });
        
    
});

