(function ($) {

    // Creating the sweetPages jQuery plugin:
    $.fn.sweetPages = function (opts) {

        // If no options were passed, create an empty opts object
        if (!opts) opts = {};

        var resultsPerPage = opts.perPage || 4;

        // The plugin works best for unordered lists, althugh ols would do just as well:
        var ul = this;
        var className = $(this).attr('class');
        var con = '.' + className + ':visible';

        ul = $(con);
        var li = ul.find('li');

        li.each(function () {
            // Calculating the height of each li element, and storing it with the data method:
            var el = $(this);
            el.data('height', el.outerHeight(true));
        });

        // Calculating the total number of pages:
        var pagesNumber = Math.ceil(li.length / resultsPerPage);

        // If the pages are less than two, do nothing:
        if (pagesNumber < 2) return this;

        // Creating the controls div:       
        var swControls = $('<div class="swControls">');

        var hasSwPage = true;
        if (ul.find('.swPage').get(0) == undefined)
            hasSwPage = false;

        for (var i = 0; i < pagesNumber; i++) {
            // Slice a portion of the lis, and wrap it in a swPage div:
            if (!hasSwPage)
                li.slice(i * resultsPerPage, (i + 1) * resultsPerPage).wrapAll('<div class="swPage" />');
            // Adding a link to the swControls div:
            swControls.append('<a href="" class="swShowPage">' + (i + 1) + '</a>');
        }

        ul.append(swControls);

        var maxHeight = 0;
        var totalWidth = 0;

        var swPage = ul.find('.swPage');
        swPage.each(function () {

            // Looping through all the newly created pages:

            var elem = $(this);

            var tmpHeight = 0;
            elem.find('li').each(function () {
                if ($(this).data('height') > tmpHeight) {
                    tmpHeight = $(this).data('height');
                }
            });

            if (tmpHeight > maxHeight)
                maxHeight = tmpHeight;

            totalWidth += elem.outerWidth();

            elem.css('float', 'left').width(ul.width());
        });


        var hasSwSlider = true;
        if (ul.find('.swSlider').get(0) == undefined)
            hasSwSlider = false;



        if (!hasSwSlider) {
            swPage.wrapAll('<div class="swSlider" />');
        }

        ul.height(maxHeight);
        var swSlider = ul.find('.swSlider');

        if (!hasSwSlider) {
            swSlider.append('<div class="clear" />');
        }

        var hyperLinks = ul.find('a.swShowPage');

        hyperLinks.click(function (e) {

            // If one of the control links is clicked, slide the swSlider div 
            // (which contains all the pages) and mark it as active:

            $(this).addClass('active').siblings().removeClass('active');

            
            var index = $.trim($(this).text()) != "" ? $.trim($(this).text()) : 1;
            var start = (index - 1) * 4 + 1;
            var end = index * 4;

            li.each(function (ind, obj) {
                var temp = ind + 1;
                if (eval(temp) >= start && eval(temp) <= end) {
                    $(obj).fadeIn("slow").show();
                } else {
                    $(obj).fadeOut("slow").hide();
                }
            });

            //swSlider.stop().animate({ 'margin-left': -(parseInt($(this).text()) - 1) * ul.width() }, 'slow');
            e.preventDefault();
        });

        // Mark the first link as active the first time this code runs:
        hyperLinks.eq(0).addClass('active');

        var start = 1;
        var end = 4;

        li.each(function (ind, obj) {
            var temp = ind + 1;
            if (eval(temp) >= start && eval(temp) <= end) {
                $(obj).fadeIn("slow").show();
            } else {
                $(obj).fadeOut("slow").hide();
            }
        });

        // Center the control div:

        swSlider.css({
            'margin-left': 0
        });

   

        swControls.css({
            'padding-left': (860 - pagesNumber*20)/2
        });

        //swControls.width()

        return this;

    }
})(jQuery);