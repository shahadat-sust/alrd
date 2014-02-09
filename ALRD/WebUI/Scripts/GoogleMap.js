var GoogleMap = {
    map: "",
    marker: "",
    location: "",
    geocoder: "",
    init: function () {

        var lat = 23.709921000000000000;
        var lng = 90.407143000000020000;

        if ($('.txtLatitude').get(0) != undefined && $.trim($('.txtLatitude').val()) != "")
            lat = $.trim($('.txtLatitude').val());

        if ($('.txtLongitude').get(0) != undefined && $.trim($('.txtLongitude').val()) != "")
            lng = $.trim($('.txtLongitude').val());

        GoogleMap.geocoder = new google.maps.Geocoder();

        $(document).on('change', '.address-field', function () {
            var address = GoogleMap.getAddress();
            GoogleMap.drawMapByAddress(address);
        });

        $(document).on('change', '.lat-lng-field', function () {

            var lat = 23.709921000000000000;
            var lng = 90.407143000000020000;

            if ($.trim($('.txtLatitude').val()) != "")
                lat = $.trim($('.txtLatitude').val());
            if ($.trim($('.txtLongitude').val()) != "")
                lng = $.trim($('.txtLongitude').val());

            GoogleMap.drawMapByLatLng(lat, lng);

        });

        GoogleMap.drawMapByLatLng(lat, lng);

    },

    drawMapByLatLng: function (lat, lng) {

        if ($('.txtLatitude').get(0) != undefined)
            $('.txtLatitude').val(lat);

        if ($('.txtLongitude').get(0) != undefined)
            $('.txtLongitude').val(lng);

        var myLatlng = new google.maps.LatLng(lat, lng);
        var myOptions = {
            zoom: 10,
            center: myLatlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }

        GoogleMap.map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
        GoogleMap.location = myLatlng;
        GoogleMap.marker = new google.maps.Marker({
            position: GoogleMap.location,
            map: GoogleMap.map
        });
        GoogleMap.marker.setTitle(GoogleMap.getAddress().replace(/(<([^>]+)>)/ig, ""));

        GoogleMap.attachMessage();

    },

    drawMapByAddress: function (address) {

        if (GoogleMap.geocoder && address != "") {
            GoogleMap.geocoder.geocode(
                { 'address': address },
                function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        var lat = results[0].geometry.location.lat();
                        var lng = results[0].geometry.location.lng();
                        GoogleMap.drawMapByLatLng(lat, lng);
                    } else {
                        $(".labelException").html("Google map is not available for this address");
                        $(document).scrollTop(0);
                    }
                });
        } else {
            $(".labelException").html("Google map is not available for this address");
            $(document).scrollTop(0);
        }
    },

    attachMessage: function () {

        var infowindow = new google.maps.InfoWindow({
            content: GoogleMap.getAddress(),
            size: new google.maps.Size(50, 50)
        });

        google.maps.event.addListener(GoogleMap.marker, "click", function () {
            infowindow.open(GoogleMap.map, GoogleMap.marker);
        });
    },

    getAddress: function () {

        var location = $.trim($('.txtAddress').html());

        var address = "";
        var countryID = $('.ddlCountry').val();
        var country = "";

        var cityID = $('.ddlCity').val();
        var city = "";

        $('.ddlCountry > option').each(function () {
            if (countryID > 0 && $.trim($(this).attr("value")) === countryID)
                country = $.trim($(this).html());
        });

        $('.ddlCity > option').each(function () {
            if (cityID > 0 && $.trim($(this).attr("value")) === cityID)
                city = $.trim($(this).html());
        });

        if (city != "")
            address += city;

        if (country != "")
            address += (city != "" ? ", " : "") + country;

        if (location != "" && address != "")
            address = location + ", " + address;
        else if (location != "" && address === "")
            address = location;

        return address;

    }
}

//$(document).ready(function () {
//    GoogleMap.init();
//});