var Home = {
    webRoot: "",
    id: "",
    init: function () {

        Home.webRoot = $.trim($('.webRoot').html()) != "" ? $.trim($('.webRoot').html()) : "~/";

        $('.divOfferPopUp').dialog({
            position: "center",
            width: '1060px',
            autoOpen: false
        });

        $("#hometabs").tabs();
        Home.initPager();

        $(document).on("click", ".hometabs-li", function (event) {
            $(".swControls").remove();
            Home.initPager();
        });

        $(document).on("click", ".lnkOfferPopUp", function (event) {
            event.preventDefault();
            openOfferPopUp(this);
        });

        $(document).on("click", ".lnkReferPopUp", function (event) {
            event.preventDefault();
            openReferPopUp(this);
        });
    },
    initPager: function () {
        $('.pager-holder').sweetPages({ perPage: 4 });
        var controls = $('.swControls').detach();
        controls.appendTo('.main-pager');
    }
}

$(document).ready(function () {
    Home.init();
});