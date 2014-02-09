

function openImageUploader(control) {

    var type = $(control).attr('imgtype');
    var index = $(control).attr('index');
    var frame = "<iframe id='iImageLoader' src='ImageUploader.aspx?imageid=IMG_" + index + "_" + "&type=" + type + "&index=" + index + "' width='100%' height='80px' frameborder='0' ><p>Your browser does not support iframes.</p></iframe>";
    var dialogId = ".divDialogImageUpload" + index;

    $(dialogId).html(frame);
    $(dialogId).dialog({ position: "center", width: '600px' }, "open");

    return false;

}

function closeImageUploader(imagename, index) {

    var textbox = ".txtImage" + index;
    var container = ".divImageUpload" + index;
    var dialogId = ".divDialogImageUpload" + index;
    var imgUrl = "../../" + imagename;

    $(textbox).val(imagename);
    $(container).attr('src', imgUrl);
    $(dialogId).dialog("close");
}

function openOfferPopUp(control) {
    var offerID = $(control).attr('offerID');
    var frame = "<iframe id='iImageLoader' src='" + Home.webRoot + "Pages/Consumer/OfferDetailInfo.aspx?offerID=" + offerID + "' width='100%' height='600px' frameborder='0' ><p>Your browser does not support iframes.</p></iframe>";
    $('.divOfferPopUp').html(frame);
    $('.divOfferPopUp').dialog("open");
    return false;
}

function closeOfferPopUp() {
    $('.divOfferPopUp').dialog('close');
}

function openHotelSearchPopUp(control) {
    var rid = $(control).closest('.parent').find('.txtRoomInfoID').val();
    var frame = "<iframe id='iImageLoader' src='" + Home.webRoot + "Pages/Consumer/HotelSearchPopUp.aspx?rid=" + rid + "' width='100%' height='500px' frameborder='0' ><p>Your browser does not support iframes.</p></iframe>";
    $('.divHotelSearchPopUp').html(frame);
    $('.divHotelSearchPopUp').dialog({ position: "center", width: '500px' }, "open");
    return false;
}

function closeHotelSearchPopUp() {
    $('.divHotelSearchPopUp').dialog('close');
    window.open('HotelWiseRoomBooking.aspx');
}

function openLoginPopUp() {
    var frame = "<iframe id='iImageLoader' src='" + Home.webRoot + "Pages/Consumer/LoginPopUp.aspx' width='100%' height='300px' frameborder='0' ><p>Your browser does not support iframes.</p></iframe>";
    $('.divLoginPopUp').html(frame);
    $('.divLoginPopUp').dialog({ position: "center", width: '600px' }, "open");
    return false;
}

function closeLoginPopUp() {
    $('.divLoginPopUp').dialog('close');
    __doPostBack('successfullylogin', "");
}

function openReferPopUp(control) {
    var pid = $(control).attr('pid');
    var rtype = $(control).attr('rtype');
    var frame = "<iframe id='iImageLoader' src='" + Home.webRoot + "Pages/Consumer/ReferEmail.aspx?pid=" + pid + "&rtype=" + rtype + "' width='100%' height='600px' frameborder='0' ><p>Your browser does not support iframes.</p></iframe>";
    $('.divReferPopUp').html(frame);
    $('.divReferPopUp').dialog({ position: "center", width: '800px' }, "open");
    return false;
}

function closeReferPopUp() {
    $('.divReferPopUp').dialog('close');
    alert("Email has been sent successfully!");
}
