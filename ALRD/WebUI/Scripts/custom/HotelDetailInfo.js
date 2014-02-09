var HotelDetailInfo = {
    id: "",
    init: function () {
        $("#hoteltabs").tabs();

        $(document).on("click", ".btnHotelSearchPopUp", function (event) {
            event.preventDefault();
            openHotelSearchPopUp(this);
        });

        $(document).on('click', '.hoteltabs-3', function () {

            var lat = 23.709921000000000000;
            var lng = 90.407143000000020000;

            if ($.trim($('.lblLat').html()) != "")
                lat = $.trim($('.lblLat').html());
            if ($.trim($('.lblLng').html()) != "")
                lng = $.trim($('.lblLng').html());

            GoogleMap.drawMapByLatLng(lat, lng);

        });
    }
}

$(document).ready(function () {
    HotelDetailInfo.init();
});