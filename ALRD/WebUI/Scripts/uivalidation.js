var temp = '';

function validateForm() {
    temp = '';
    var errMsg = "";
    var notValid = 0;

    var isLengthError = false;

    //containerid = (containerid == null || containerid == undefined) ? "" : ("#" + containerid + " ");
    containerid = ".form-container ";

    //required field validator
    //alert(containerid + "input.required," + containerid + "textarea.required");
    $(containerid + "input.required," + containerid + "textarea.required").each(function (i) {
        //alert( "textarea.required");
        var currValue = $.trim(this.value);
        notValid += MarkError(this, currValue.length > 0);
    });

    //password field validator
    $(containerid + "input.password").each(function (i) {
        notValid += MarkError(this, this.value.length > 0);
    });

    //numeric field validator
    $(containerid + "input.integer").each(function (i) {
        var currValue = $.trim(this.value);
        currValue = currValue.replace(/,/g, "");
        notValid += MarkError(this, (IsInteger(currValue) && eval(currValue) > 0));
    });



    //alphabet field validator
    $(containerid + "input.letter").each(function (i) {
        var letters = /^[a-zA-Z]+$/;
        var currValue = $.trim(this.value);
        notValid += MarkError(this, (currValue.match(letters) && currValue.length > 0));
    });

    //alphabet field validator
    $(containerid + "input.letternr").each(function (i) {
        var letters = /^[a-zA-Z]+$/;
        var currValue = $.trim(this.value);
        notValid += MarkError(this, (currValue.match(letters)));
    });


    //numeric field validator
    $(containerid + "input.required2Digit").each(function (i) {
        this.value = $.trim(this.value);
        var temp = MarkError(this, this.value.length > 1);
        notValid += temp;
        isLengthError = temp > 0;
    });

    $(containerid + "input.required5Digit").each(function (i) {
        this.value = $.trim(this.value);
        var temp = MarkError(this, this.value.length == 5);
        notValid += temp;
        isLengthError = temp > 0;
    });

    //nonrequired numeric field validator
    $(containerid + "input.integernr").each(function (i) {
        var currValue = $.trim(this.value);
        currValue = currValue.replace(/,/g, "");
        if (currValue.length < 1) currValue = "0";
        notValid += MarkError(this, IsInteger(currValue));
    });

    //numeric field validator with comma seperator
    $(containerid + "input.integercomma").each(function (i) {
        var currValue = $.trim(this.value);
        currValue = currValue.replace(/,/g, "");
        notValid += MarkError(this, (IsInteger(currValue) && eval(currValue) > 0));
    });

    //nonrequired numeric field validator with comma seperator
    $(containerid + "input.integercommanr").each(function (i) {
        var currValue = $.trim(this.value);
        currValue = currValue.replace(/,/g, "");
        if (currValue.length < 1) currValue = "0";
        notValid += MarkError(this, IsInteger(currValue));
    });

    //decimal field validator
    $(containerid + "input.decimal").each(function (i) {
        var currValue = $.trim(this.value);
        currValue = currValue.replace(/,/g, "");
        notValid += MarkError(this, (IsDouble(currValue) && eval(currValue) > 0));
    });

    //decimal field validator allow 0
    $(containerid + "input.decimalallowzero").each(function (i) {
        var currValue = $.trim(this.value);
        currValue = currValue.replace(/,/g, "");
        notValid += MarkError(this, (IsDouble(currValue) && eval(currValue) < 100));
    });

    //nonrequired decimal field validator
    $(containerid + "input.decimalnr").each(function (i) {
        var currValue = $.trim(this.value);
        currValue = currValue.replace(/,/g, "");
        if (currValue.length < 1) currValue = "0";
        notValid += MarkError(this, IsDouble(currValue));
    });


    //date field validator dd-MM-yyyy
    $(containerid + "input.date").each(function (i) {
        var currValue = $.trim(this.value);
        notValid += MarkError(this, IsDate(currValue, false));
    });

    //nonrequired date field validator dd-MM-yyyy
    $(containerid + "input.datenr").each(function (i) {
        var currValue = $.trim(this.value);
        notValid += MarkError(this, IsDate(currValue, true));
    });

    //future date field validator dd-MM-yyyy
    $(containerid + "input.datef").each(function (i) {
        var currValue = $.trim(this.value);
        notValid += MarkError(this, IsDateF(currValue, false));
    });

    //nonrequired future date field validator
    $(containerid + "input.datenrf").each(function (i) {
        var currValue = $.trim(this.value);
        notValid += MarkError(this, IsDateF(currValue, true));
    });


    //date field validator dd-MM-yyyy
    $(containerid + "input.maxdate").each(function (i) {
        var currValue = $.trim(this.value);
        notValid += MarkError(this, IsDate(currValue, false));
    });

    $(containerid + "input.mindate").each(function (i) {
        var currValue = $.trim(this.value);
        notValid += MarkError(this, IsDate(currValue, false));
    });

    //date field validator dd-MM-yyyy
    $(containerid + "input.maxdatenr").each(function (i) {
        var currValue = $.trim(this.value);
        notValid += MarkError(this, IsDate(currValue, true));
    });

    $(containerid + "input.mindatenr").each(function (i) {
        var currValue = $.trim(this.value);
        notValid += MarkError(this, IsDate(currValue, true));
    });

    //time field validator hh:mm tt
    $(containerid + "input.time").each(function (i) {
        var currValue = $.trim(this.value);
        notValid += MarkError(this, IsTime(currValue));
    });

    //nonrequired time field validator hh:mm tt
    $(containerid + "input.timenr").each(function (i) {
        var currValue = $.trim(this.value);
        if (currValue.length < 1) return true;
        notValid += MarkError(this, IsTime(currValue));
    });

    //email field validator
    $(containerid + "input.email").each(function (i) {
        var currValue = $.trim(this.value);
        notValid += MarkError(this, IsEmail(currValue));
    });

    //nonrequired email field validator
    $(containerid + "input.emailnr").each(function (i) {
        var currValue = $.trim(this.value);
        if (currValue.length < 1) return true;
        notValid += MarkError(this, IsEmail(currValue));
    });

    //drop down list validator
    $(containerid + "select.required").each(function (i) {
        //alert('true');
        notValid += MarkErrorForDDL(this, this.selectedIndex > 0);
    });

    if (notValid > 0) {
        errMsg = "<b>Please provide all required information.</b><br />" + temp;
    }

    if (notValid > 0) {
        $("span[id$=lblException]").html(errMsg).css("color", "red");
        $("span[id$=lblResult]").html("");
        $(document).scrollTop(0);
        return false;
    }
    else {
        $("span[id$=lblException]").html("");
        return true;
    }
}

//check valid time 12:15
function IsTime(val) {
    var err = 0;
    if (val.length != 5) err = 1;
    var hh = val.substring(0, 2); // Hour f
    var c = val.substring(2, 3); // ':'
    var mm = val.substring(3, 5); // Min b


    if (hh < 0 || hh > 23) {
        err = 1;
    }
    if (mm < 0 || mm > 59) {
        err = 1;
    }

    if (err == 1) {
        return false;
    }
    else {
        return true;
    }
}

//check valid time 123556 hhmmss 24 hour
function IsAccessTime(val) {
    var err = 0;
    if (val.length != 6) err = 1;
    hh = val.substring(0, 2); // Hour f
    mm = val.substring(2, 4); // Min b
    ss = val.substring(4, 6); // AM/PM

    if (hh < 0 || hh > 24) {
        err = 1;
    }
    if (hh == 24) {
        if (mm > 0) {
            err = 1;
        }
        if (ss > 0) {
            err = 1;
        }
    }
    else {
        if (mm < 0 || mm > 59) {
            err = 1;
        }
        if (ss < 0 || ss > 59) {
            err = 1;
        }
    }
    if (err == 1) {
        return false;
    }
    else {
        return true;
    }
}


//check valid time 1235 hhmm 24 hour
function IsAccessTimehhmm(val) {
    var err = 0;
    if (val.length != 4) err = 1;
    hh = val.substring(0, 2); // Hour f
    mm = val.substring(2, 4); // Min b

    if (hh < 0 || hh > 24) {
        err = 1;
    }
    if (hh == 24) {
        if (mm > 0) {
            err = 1;
        }
    }
    else {
        if (mm < 0 || mm > 59) {
            err = 1;
        }
    }
    if (err == 1) {
        return false;
    }
    else {
        return true;
    }
}

//check valid date 25/12/1989
function IsDate(val, allowBalnk) {
    if (allowBalnk && val.length == 0) return true;
    var dateaprts = val.split('-');
    var dt = new Date(dateaprts[2], dateaprts[1] - 1, dateaprts[0]);
    return (dt.getDate() == dateaprts[0] && dt.getMonth() == dateaprts[1] - 1 && dt.getFullYear() == dateaprts[2]);
}

//check valid date 25/12/1989 and Not future date
function IsDateF(val, allowBalnk) {
    var curDate = new Date();
    if (allowBalnk && val.length == 0) return true;
    var dateaprts = val.split('-');
    var dt = new Date(dateaprts[2], dateaprts[1] - 1, dateaprts[0]);
    return (dt.getDate() == dateaprts[0] && dt.getMonth() == dateaprts[1] - 1 && dt.getFullYear() == dateaprts[2] && dt <= curDate);
}

//check valid integer 1,15,18
function IsInteger(val) {
    var re = new RegExp("^[0-9]+$");
    return val.match(re);
}

//check valid decimal number  125,125.50
function IsDouble(val) {
    val = val.replace(/,/g, '');
    return !isNaN(val) && (val.length > 0);
}
//check valid email abc@yahoo.com
function IsEmail(val) {
    var re = new RegExp("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
    //var re = new RegExp("^[0-9]+$");
    return val.match(re);
}

function MarkError(control, isValid) {
    //$(control.offsetParent).find("BR,p").remove();

    if (isValid) {
        $(control).css("border-color", "gray");
        if ($(control).hasClass('required2Digit')) {
            $(control).attr('title', '');
        }
        else if ($(control).hasClass('required5Digit')) {
            $(control).attr('title', '');
        }
        return 0;
    }
    else {
        //    $(control.offsetParent).append("<br><p style='color:red'>Required</p>");
        //error +=$(this).attr('id').split('_txt')[1]+'<br>';
        $(control).css("border-color", "red");
        if ($(control).hasClass('required2Digit')) {
            $(control).attr('title', 'At least two character required');
        }
        else if ($(control).hasClass('required5Digit')) {
            $(control).attr('title', 'Five character required');
        }
        return 1;
    }
}

function MarkErrorForDDL(control, isValid) {
    if (isValid) {
        $(control).css("border-color", "gray");
        return 0;
    }
    else {
        $(control).css("border-color", "red");
        return 1;
    }
}

function validateSubmit(msg) {

    var flag = false;

    try {
        flag = validateForm();
        if (flag && msg != undefined && $.trim(msg) != "") {
            flag = confirm(msg);
        }
    } catch (e) {
        flag = false;
    }

    return flag;
}
