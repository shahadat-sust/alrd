/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    // Get layout offset.
    var sidebarleft = $("#hHeader").offset().left;
    // Override Side Bar offset.
    $("#hSideBar").css({left: sidebarleft});
    // Reposition Side Bar regarding window resize.
    $(window).on("resize load", function() {
        sidebarleft = $("#hHeader").offset().left;
        $("#hSideBar").css({left: sidebarleft});
    });

    /*
     * Home Search Tab;
     */
    
    var tbLinks = $('#tabLinks li a');
    var tbContents = $('#homeTabs div.tab-content');
    // Hide all tab contents;
    tbContents.hide();
    // Show only first tab content;
    $('#homeTabs div:first').show();    
    // bind to change the tabs
    $('#tabLinks li a').click(function(e) {    
        e.preventDefault();
        // Remove all open;
        tbLinks.removeClass('open');
        // Set current tab link;
        $(this).addClass('open');
        // Get the current tab's content Id;
        var currentTab = $(this).attr('href');
        // Hide all tab contents;
        tbContents.hide();
        // Show only current tab's content;
        $(currentTab).show();
       
        return false;
    });
    
    $("input").focus(function(e){
        $(this).next('.hint').show();
    }).blur(function(e){
        $(this).next('.hint').hide();
    });

});

