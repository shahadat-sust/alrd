function initInputFields() {
    initIntegerFields();
    initDecimalFields();
    initDateFields();
    checkTextAreaMaxLength();
    InitTimePicker();
    //InitEditableCombo();
    //texthint.dohint();


    var dt = new Date();
    var currYear = dt.getFullYear();
    var nextYear = eval(currYear) + 10;
    $("input.date,input.datenr,input.datef,input.datenrf,input.grddate,input.grddatenr").datepicker({ dateFormat: 'dd-mm-yy', changeMonth: true, changeYear: true, yearRange: '1930:' + nextYear });
    $("input.maxdate").datepicker({ dateFormat: 'dd-mm-yy', maxDate: new Date(), changeMonth: true, changeYear: true });
    $("input.mindate").datepicker({ dateFormat: 'dd-mm-yy', minDate: new Date(), changeMonth: true, changeYear: true });
    $("input.modifydate").datepicker({ dateFormat: 'mm/dd', changeMonth: true, changeYear: true, yearRange: '1930:' + nextYear });
    $("input.dateyear").datepicker({ dateFormat: 'yy', changeMonth: false, changeYear: true, yearRange: '1930:' + nextYear });
    $("input.dateyear").attr("readonly", "true");
    $("input.readonly").attr("readonly", "true");
    $('.hidden').hide();

    $("input.hdate").datepicker({
        showOn: 'button',
        buttonText: 'Show Date',
        buttonImageOnly: true,
        buttonImage: '../../images/cal.png',
        dateFormat: 'dd-mm-yy',
        changeMonth: true,
        changeYear: true,
        yearRange: '1930:' + nextYear
    });
}

function InitTimePicker() {

    $('.time').mask('99:99');

    $('.time').timepicker({
        timeSeparator: ':',
        showLeadingZero: true,
        onHourShow: function (hour) {
            var tpEndHour = $(this).timepicker('getHour');
            return true;
        },
        onMinuteShow: function (hour, minute) {
            var tpEndHour = $(this).timepicker('getHour');
            var tpEndMinute = $(this).timepicker('getMinute');
            return true;
        }
    });

}

function InitEditableCombo() {
    $(document).ready(function () {
        $("select").searchable();
    });

    // demo functions
    $(document).ready(function () {
        $("#value").html($("select :selected").text() + " (VALUE: " + $("select").val() + ")");
        $("select").change(function () {
            $("#value").html(this.options[this.selectedIndex].text + " (VALUE: " + this.value + ")");
        });
    });
}
//Initializing integer fields
function initIntegerFields() {

    $("input.integer, input.integernr, input.grdinteger, input.grdintegernr, input.grdintegerAllowZero ").each(function () {
        if ($(this).attr('maxlength') == undefined)
            $(this).autoNumeric({ aSep: '', vMin: '0', vMax: '99999999' });
        else {
            var att = $(this).attr('maxlength');
            var num = "";
            var c = parseInt(att);
            for (var i = 0; i < c; i++) {
                num = num + "9";
            }
            try {
                $(this).autoNumeric({ aSep: '', vMin: '0', vMax: num });
            } catch (e) {
            }
        }
    });
}

//Initializing Date fields
function initDateFields() {

    $("input.date,input.datef,input.maxdate,input.time").keydown(function (event) {
        // Allow backspace, delete, space, a-z.
        event.preventDefault();
    });

    $("input.datenr,input.datenrf,input.maxdatenr").keydown(function (event) {
        // Allow backspace, delete, space, a-z.
        var keyCode = event.which;
        if (keyCode == null || keyCode == 8) {

        } else {
            event.preventDefault();
        }
    });

}

//Initializing decimal fields
function initDecimalFields() {
    $("input.decimal, input.decimalnr, input.decimalallowzero, input.grddecimal, input.grddecimalnr, input.grddecimalallowzero").each(function () {
        var dpstring = "."
        if ($(this).attr('dp') == undefined)
            $(this).autoNumeric({ aSep: '', vMin: '0', vMax: '99999999.99' });
        else {

            var dp = $(this).attr('dp');
            for (var i = 0; i < dp; i++) {
                dpstring = dpstring + '9';
            }
        }

        if ($(this).attr('maxlength') == undefined)
            $(this).autoNumeric({ aSep: '', vMin: '0', vMax: '99999999' + dpstring });
        else {
            var att = $(this).attr('maxlength');

            var num = "";
            var c = parseInt(att);
            //alert(c);
            for (var i = 0; i < c; i++) {
                num = num + "9";
            }
            //alert(att +" : " + num);

            num = num + dpstring;
            try {
                $(this).autoNumeric({ aSep: '', vMin: '0', vMax: num });

            } catch (e) {

            }
        }
    });

}

//-- checks valid key for a date field --//
function allowValidDate(evt, fieldValue) {
    var keyCode = "";
    if (window.event) {
        keyCode = window.event.keyCode;
        evt = window.event;
    }
    else if (evt) keyCode = evt.which;
    else return true;
    dateArray = fieldValue.split(""); //take every character of field value in array

    if (fieldValue.length == 0) {
        if ((keyCode < 48 || keyCode > 51))// (0-3)
        {
            evt.returnValue = false;
            return false;
        }
    }
    if (fieldValue.length == 1) {
        // If first digit of date is '3' then second digit should be (0-1)
        if (dateArray[0] == "3") {
            if (keyCode < 48 || keyCode > 49)// (0-1)
            {
                evt.returnValue = false;
                return false;
            }
        }
        // If first digit of date is '0' then second digit should not be '0'
        if (dateArray[0] == "0") {
            if (keyCode == 48)// (0)
            {
                evt.returnValue = false;
                return false;
            }
        }
        else if ((keyCode < 48 || keyCode > 57))//(0-9)
        {
            evt.returnValue = false;
            return false;
        }
    }
    if (fieldValue.length == 2) {
        if ((keyCode != 45))// (-)
        {
            evt.returnValue = false;
            return false;
        }
    }
    if (fieldValue.length == 3) {
        if ((keyCode < 48 || keyCode > 49))//(0-1)
        {
            evt.returnValue = false;
            return false;
        }
    }
    if (fieldValue.length == 4) {
        // If first digit of month is '1' then second digit should be (0-2)
        if (dateArray[3] == "1") {
            if (keyCode < 48 || keyCode > 50)// (0-1)
            {
                evt.returnValue = false;
                return false;
            }
        }
        // If first digit of month is '0' then second digit should not be '0'
        if (dateArray[3] == "0") {
            if (keyCode == 48)// (0-1)
            {
                evt.returnValue = false;
                return false;
            }
        }
        if ((keyCode < 48 || keyCode > 57))//(0-9)
        {
            evt.returnValue = false;
            return false;
        }
    }
    if (fieldValue.length == 5) {
        if ((keyCode != 45))// (-)
        {
            evt.returnValue = false;
            return false;
        }
    }
    if ((fieldValue.length > 5) && (fieldValue.length < 10)) {
        if ((keyCode < 48 || keyCode > 57))//(0-9)
        {
            evt.returnValue = false;
            return false;
        }
    }
    // check if year is not less then 0001
    if (fieldValue.length == 9) {
        if (dateArray[6] == "0" && dateArray[7] == "0" && dateArray[8] == "0") {
            if (keyCode == 48) {
                evt.returnValue = false;
                return false;
            }
        }
    }
    // check if field length is greater than 9
    if (fieldValue.length > 9) {
        evt.returnValue = false;
        return false;
    }

    else return true;
}

//imposes maxlength on TEXTAREA element
function checkTextAreaMaxLength() {
    $('textarea[stringLength]').keyup(function () {
        var max = parseInt($(this).attr('stringLength'));
        if ($(this).val().length > max) {
            $(this).val($(this).val().substr(0, $(this).attr('stringLength')));
        }
    });
}

//-- checks the length of a text field --//
function checkFieldLength(evt, fieldValue, maxLen) {
    var keyCode = "";
    if (window.event) {
        keyCode = window.event.keyCode;
        evt = window.event;
    }

    if (fieldValue.length >= maxLen) {
        evt.returnValue = false;
        return false;
    }
    else {
        return true;
    }
}

function checkValidDate(date)// dd-mm-yyyy
{
    var dateValid = true;

    try {
        var dateSeperator = "";
        //See what the character is that seperates the date parts...
        if (date.indexOf("-") > 0) {
            dateSeperator = "-";
        }

        else {
            //if it's not one of the ones listed above, then we don't have a valid date...
            dateValid = false;
        }

        var dateArray = new Array(5);
        dateArray = date.split(dateSeperator);

        if (dateArray[0].length > 2) {
            dateValid = false;
        }
        if (dateArray[1].length > 2) {
            dateValid = false;
        }
        if (dateArray[2].length != 4) {
            dateValid = false;
        }

        //If any of the parts aren't numbers, then we don't have a date
        if (isNaN(dateArray[0]) || isNaN(dateArray[1]) || isNaN(dateArray[2])) {
            dateValid = false;
        }

        var iDate = parseInt(dateArray[0], 10);
        var iMonth = parseInt(dateArray[1], 10);
        var iYear = parseInt(dateArray[2], 10);

        //If the year is before 1900 it's not valid...
        if (iYear < 1900) {
            dateValid = false;
        }
        //Make sure our month is in range...
        else if (iMonth < 0 || iMonth > 12) {
            dateValid = false;
        }
        //Jan, Mar, May, July, Aug, Oct and Dec must have between 1 and 31 days...
        else if ((iMonth == 1 || iMonth == 3 || iMonth == 5 || iMonth == 7 || iMonth == 8 || iMonth == 10 || iMonth == 12)
				   && (iDate < 0 || iDate > 31)) {
            dateValid = false;
        }
        //April, June, Sept, and Nov must have between 1 and 30 days...
        else if ((iMonth == 2 || iMonth == 6 || iMonth == 9 || iMonth == 11)
				   && (iDate < 0 || iDate > 30)) {
            dateValid = false;
        }
        //Feb must have 28 days unless it's a leap year. If the year is evenly divisable by 4, then we're in a leap year
        //NOTE: that this will fail for the year 2100, since 2100 is not a leap century
        //			(even though we really don't have to worry about this yet)
        else if ((iMonth == 2) && (iYear % 4 == 0) && (iDate < 0 || iDate > 29)) {
            dateValid = false;
        }
        //Now we handle non-leap year Feb's...
        else if ((iMonth == 2) && (iYear % 4 != 0) && (iDate < 0 || iDate > 28)) {
            dateValid = false;
        }
    }
    catch (e) {
        dateValid = false;
    }
    return dateValid;
}

function checkCurrentDate(date, currentyear, currentmonth, currentday)// check valid current date: dd-mm-yyyy
{
    var dateValid = true;

    try {
        var dateSeperator = "";
        //See what the character is that seperates the date parts...
        if (date.indexOf("-") > 0) {
            dateSeperator = "-";
        }
        else {
            //if it's not one of the ones listed above, then we don't have a valid date...
            dateValid = false;
        }

        var dateArray = new Array(5);
        dateArray = date.split(dateSeperator);

        if (dateArray[0].length > 2) {
            dateValid = false;
        }
        if (dateArray[1].length > 2) {
            dateValid = false;
        }
        if (dateArray[2].length != 4) {
            dateValid = false;
        }

        //If any of the parts aren't numbers, then we don't have a date
        if (isNaN(dateArray[0]) || isNaN(dateArray[1]) || isNaN(dateArray[2])) {
            dateValid = false;
        }

        var iDate = parseInt(dateArray[0], 10);
        var iMonth = parseInt(dateArray[1], 10);
        var iYear = parseInt(dateArray[2], 10);

        //If the year is before 1900 or later than the current date, it's not valid...
        if (iYear < 1900 || iYear > currentyear) {
            dateValid = false;
        }
        //Make sure our month is in range...
        else if (iMonth < 0 || iMonth > 12) {
            dateValid = false;
        }
        //Jan, Mar, May, July, Aug, Oct and Dec must have between 1 and 31 days...
        else if ((iMonth == 1 || iMonth == 3 || iMonth == 5 || iMonth == 7 || iMonth == 8 || iMonth == 10 || iMonth == 12)
				   && (iDate < 0 || iDate > 31)) {
            dateValid = false;
        }
        //April, June, Sept, and Nov must have between 1 and 30 days...
        else if ((iMonth == 2 || iMonth == 6 || iMonth == 9 || iMonth == 11)
				   && (iDate < 0 || iDate > 30)) {
            dateValid = false;
        }
        //Feb must have 28 days unless it's a leap year. If the year is evenly divisable by 4, then we're in a leap year
        //NOTE: that this will fail for the year 2100, since 2100 is not a leap century
        //			(even though we really don't have to worry about this yet)
        else if ((iMonth == 2) && (iYear % 4 == 0) && (iDate < 0 || iDate > 29)) {
            dateValid = false;
        }
        //Now we handle non-leap year Feb's...
        else if ((iMonth == 2) && (iYear % 4 != 0) && (iDate < 0 || iDate > 28)) {
            dateValid = false;
        }
        else {
            //Now see if we can create a Date object with our date parts. If so, then we have a valid date...
            //			var validDate:Date = new Date(iYear, iMonth, iDate);
            //check for current date
            if ((iYear == currentyear && iMonth > currentmonth) || (iYear == currentyear && iMonth == currentmonth && iDate > currentday)) {
                dateValid = false;
            }
        }
    }
    catch (e) {
        dateValid = false;
    }
    return dateValid;
}

//adds comma to a currency type value
function addCommas(nStr) {
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
}



function clearEntryFields(confMsg) {
    if (confirm(confMsg)) {
        try {
            var selectedRow = $("tr[isselected=true]");
            if ($(selectedRow).length) {
                $(selectedRow).click();
                return false;
            }
        } catch (e) {
        }

        $("input.inputField:not(.noclear)").each(function (i) {
            this.value = "";
            $(this).css("border-color", "gray");
        });
        $("textarea.inputField").each(function (i) {
            this.value = "";
            $(this).css("border-color", "gray");
        });
        $("select.inputField").each(function (i) {
            try {
                if (!$(this).is(':disabled')) {
                    this.selectedIndex = 0;
                    $(this).change();
                }
                $(this).css("border-color", "gray");
            } catch (e) {
            }
        });

        //required field validator
        $("input.required,textarea.required").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //password field validator
        $("input.password").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //numeric field validator
        $("input.integer").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //nonrequired numeric field validator
        $("input.integernr").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //numeric field validator with comma seperator
        $("input.integercomma").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //nonrequired numeric field validator with comma seperator
        $("input.integercommanr").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //decimal field validator
        $("input.decimal").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //decimal field validator allow 0
        $("input.decimalallowzero").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //nonrequired decimal field validator
        $("input.decimalnr").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //date field validator dd-MM-yyyy
        $("input.date").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //nonrequired date field validator dd-MM-yyyy
        $("input.datenr").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //future date field validator dd-MM-yyyy
        $("input.datef").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //nonrequired future date field validator
        $("input.datenrf").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //time field validator hh:mm tt
        $("input.time").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //nonrequired time field validator hh:mm tt
        $("input.timenr").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //email field validator
        $("input.email").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //nonrequired email field validator
        $("input.emailnr").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //drop down list validator
        $("select.required").each(function (i) {
            $(this).css("border-color", "gray");
        });

        $("span[id$=lblException]").html("");
        $("span[id$=lblResult]").html("");
    }
    return false;
}


function setTitle(title) {
    /*try {
    $(".lblArrow").html(title);
    var pageTitle = title.replace(">>", "-");
    document.title = pageTitle;
    } catch (e) {
    }*/
}

function clearEntryFields() {

        var containerItem = ".form-container";

        $(containerItem).find("input.inputField").each(function (i) {
            this.value = "";
            $(this).css("border-color", "gray");
        });
        $(containerItem).find("textarea.inputField").each(function (i) {
            this.value = "";
            $(this).css("border-color", "gray");
        });
        $(containerItem).find("select.inputField").each(function (i) {
            try {
                if (!$(this).is(':disabled')) {
                    this.selectedIndex = 0; /// <reference path="../Controls/Consumer/" />

                }
                $(this).css("border-color", "gray");
            } catch (e) {
            }
        });

        //required field validator
        $(containerItem).find("input.required,textarea.required").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //password field validator
        $(containerItem).find("input.password").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //numeric field validator
        $(containerItem).find("input.integer").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //nonrequired numeric field validator
        $(containerItem).find("input.integernr").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //numeric field validator with comma seperator
        $(containerItem).find("input.integercomma").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //nonrequired numeric field validator with comma seperator
        $(containerItem).find("input.integercommanr").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //decimal field validator
        $(containerItem).find("input.decimal").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //decimal field validator allow 0
        $(containerItem).find("input.decimalallowzero").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //nonrequired decimal field validator
        $(containerItem).find("input.decimalnr").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //date field validator dd-MM-yyyy
        $(containerItem).find("input.date").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //nonrequired date field validator dd-MM-yyyy
        $(containerItem).find("input.datenr").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //future date field validator dd-MM-yyyy
        $(containerItem).find("input.datef").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //nonrequired future date field validator
        $(containerItem).find("input.datenrf").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //time field validator hh:mm tt
        $(containerItem).find("input.time").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //nonrequired time field validator hh:mm tt
        $(containerItem).find("input.timenr").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //email field validator
        $(containerItem).find("input.email").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //nonrequired email field validator
        $(containerItem).find("input.emailnr").each(function (i) {
            $(this).css("border-color", "gray");
        });

        //drop down list validator
        $(containerItem).find("select.required").each(function (i) {
            $(this).css("border-color", "gray");
        });

        $(containerItem).find("span[id$=lblException]").html("");
        $(containerItem).find("span[id$=lblResult]").html("");
    
}

function initActiveMenu(form) {

    if (form === 'HOME')
        $('.HOME').addClass('active');
    else
        $('.HOME').removeClass('active');

    if (form === 'ORGANIZATION')
        $('.ORGANIZATION').addClass('active');
    else
        $('.ORGANIZATION').removeClass('active');

    if (form === 'GOVERNMENT')
        $('.GOVERNMENT').addClass('active');
    else
        $('.GOVERNMENT').removeClass('active');

    if (form === 'OFFER')
        $('.OFFER').addClass('active');
    else
        $('.OFFER').removeClass('active');
    
    if (form === 'SETUP')
        $('.SETUP').addClass('active');
    else
        $('.SETUP').removeClass('active');

    if (form === 'SECURITY')
        $('.SECURITY').addClass('active');
    else
        $('.SECURITY').removeClass('active');

    if (form === 'ORGANIZATION')
        $('.ORGANIZATION').addClass('active');
    else
        $('.ORGANIZATION').removeClass('active');

    if (form === 'ABOUT')
        $('.ABOUT').addClass('active');
    else
        $('.ABOUT').removeClass('active');

    if (form === 'CONTACT')
        $('.CONTACT').addClass('active');
    else
        $('.CONTACT').removeClass('active');

    if (form === 'REPORT')
        $('.REPORT').addClass('active');
    else
        $('.REPORT').removeClass('active');

    return false;
}