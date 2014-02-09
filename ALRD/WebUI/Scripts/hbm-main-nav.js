/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    var $mMenuItem = $("#mainNav > ul > li > a");
        
    $('li.mItem').hover(function() { 
        $(this).addClass('open');
        $('a.item-link', this).addClass('open');
        $('ul.m-sub-nav', this).addClass('open');        
    }, function() { 
        $(this).removeClass('open');
        $('a.item-link', this).removeClass('open');
        $('ul.m-sub-nav', this).removeClass('open'); 
    });
});

