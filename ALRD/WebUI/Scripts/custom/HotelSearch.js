var HotelSearch = {
    id: "",
    init: function () {

        $(document).on("click", '.hotel-more', function (event) {
            event.preventDefault();
            $(this).parent().find('.hotel-less').show();
            $(this).hide();
            $(this).closest('.hotel-top-container').find('.room-content-info').show();
        });

        $(document).on("click", '.hotel-less', function (event) {
            event.preventDefault();
            $(this).parent().find('.hotel-more').show();
            $(this).hide();
            $(this).closest('.hotel-top-container').find('.room-content-info').hide();
        });

        $("#slider-range").slider({
            range: true,
            min: 0,
            max: 5000,
            values: [0, 5000, ],
            slide: function (event, ui) {
                $(".amount").html("Tk " + ui.values[0] + " - Tk " + ui.values[1]);
                $(".txtMinRoomRent").val(ui.values[0]);
                $(".txtMaxRoomRent").val(ui.values[1]);
            }
        });
        $(".amount").html("Tk " + $("#slider-range").slider("values", 0) + " - Tk " + $("#slider-range").slider("values", 1));
        $(".txtMinRoomRent").val($("#slider-range").slider("values", 0));
        $(".txtMaxRoomRent").val($("#slider-range").slider("values", 1));

        $(document).on("click", ".lnkOfferPopUp", function (event) {
            event.preventDefault();
            openOfferPopUp(this);
        });

    }
}

$(document).ready(function () {
    HotelSearch.init();
});