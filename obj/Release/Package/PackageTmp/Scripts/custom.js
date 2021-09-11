$(document).ready(function () {
    $("#selectService").mousedown(function () {
        $(".all-services").show();
    });



    $('.top-banner').owlCarousel({
        loop: true,
        margin: 10,
        nav: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 1
            },
            1000: {
                items: 1
            }
        }
    });
    $('.feature_box').owlCarousel({
        loop: true,
        margin: 20,
        nav: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 2
            },
            1024: {
                items: 3
            },
            1190: {
                items: 3
            }
        }
    });
    $('.real_wedding').owlCarousel({
        loop: true,
        margin: 20,
        nav: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 2
            },
            1024: {
                items: 3
            },
            1190: {
                items: 3
            }
        }
    });
    $('.hotel_marriage_slide').owlCarousel({
        loop: true,
        margin: 20,
        nav: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 2
            },
            1024: {
                items: 2
            },
            1190: {
                items: 2
            }
        }
    });
    $('.hotel_marriage_slide_2').owlCarousel({
        loop: true,
        margin: 20,
        nav: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 2
            },
            1024: {
                items: 2
            },
            1190: {
                items: 2
            }
        }
    });
  

});
$(window).scroll(function () {
    var sticky = $('.sticky'),
        scroll = $(window).scrollTop();

    if (scroll >= 100) sticky.addClass('fixed');
    else sticky.removeClass('fixed');
});
$(window).scroll(function () {
    var sticky = $('.sticky_menu'),
        scroll = $(window).scrollTop();

    if (scroll >= 100) sticky.addClass('fixed_menu');
    else sticky.removeClass('fixed_menu');
});