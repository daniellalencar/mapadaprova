// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
;(function($) {
    "use strict";

    //  Animate JS
    new WOW().init();

    // stick menu function
    var nav_offset_top = $('.navbar').offset().top;

    $('.header_bottom').affix({
        offset: {
            top: nav_offset_top,
            bottom: function () {
                return (this.bottom = $('footer').outerHeight(true))
            }
        }
    });

    /*Smooth Scroll*/
    function smoothScroll4sideNav () {
        if ($('.header_area').length ) {
            $('.header_area .banner_inner .banner_content a[href*="#"]').on('click', function () {
                if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                    var target = $(this.hash);
                    if ( $(window).width() < 768 ){
                        offset_top4scroll = 100
                    }
                    target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                    if (target.length) {
                        $('html,body').animate({
                            scrollTop: target.offset().top - 70
                        }, 1000);
                        return false
                    }
                }
                return false
            })
        }
    }
    smoothScroll4sideNav();

    // Parallax
    $(function(){
        $.stellar({
            horizontalScrolling: false,
            verticalOffset: 40
        });
    });

    // Countdown JS
    $('#example').countdown({
        date: '6/24/2017 23:59:59',
        offset: -8,
        day: 'Day',
        days: 'Days'
    },
    function () {
        alert('Done!');
    });

    // Owl Carousel JS
        $(".events_slider").owlCarousel({
        navText : ["<i class='mdi mdi-arrow-left'></i>","<i class='mdi mdi-arrow-right'></i>"],
        loop:true,
        nav: true,
        dots:false,
        margin:0,
        items : 1,
        smartSpeed: 1500,
        autoplay:true,
        controls: true,
        responsiveClass:true,
        responsive:{
            320:{
                items:1,
                center: true
            }
        }
    });

    // Owl Carousel JS
    $(".about_slider").owlCarousel({
        navText : ["<i class='mdi mdi-arrow-left'></i>","<i class='mdi mdi-arrow-right'></i>"],
        loop:true,
        nav: true,
        dots:false,
        margin:30,
        items : 3,
        smartSpeed: 1500,
        autoplay:true,
        controls: true,
        responsiveClass:true,
        responsive:{
            1000:{
                items:3,
                center: true
            },
            700:{
                items:2,
                center: false
            },
            320:{
                items:1,
                center: true
            }
        }
    });

    $(".teacher_slider").owlCarousel({
        loop:true,
        nav: true,
        dots:false,
        margin:0,
        items : 4,
        autoplay:true,
        smartSpeed: 1500,
        controls: true,
        responsiveClass:true,
        navText : ["<i class='mdi mdi-arrow-left'></i>","<i class='mdi mdi-arrow-right'></i>"],
        responsive:{
            992:{
                items:4,
            },
            700:{
                items:3,
            },
            500:{
                items:2,
            },
            320:{
                items:1,
            }
        }
  });
    $(".reg_slider").owlCarousel({
        navText : ["<i class='mdi mdi-arrow-left'></i>","<i class='mdi mdi-arrow-right'></i>"],
        loop:true,
        nav: true,
        dots:false,
        margin:0,
        items : 2,
        smartSpeed: 1500,
        autoplay:true,
        controls: true,
        responsiveClass:true,
        responsive:{
            600:{
                items:2,
                center: false
            },
            320:{
                items:1,
                center: true
            }
        }
    });
    $(".reg_slider2").owlCarousel({
        loop:true,
        nav: true,
        dots:false,
        margin: 0,
        items : 3,
        smartSpeed: 1500,
        autoplay:true,
        controls: true,
        navText : ["<i class='mdi mdi-arrow-left'></i>","<i class='mdi mdi-arrow-right'></i>"],
        responsiveClass:true,
        responsive:{
            1000:{
                items:3,
                center: false
            },
            700:{
                items:2,
                center: false
            },
            320:{
                items:1,
                center: true
            }
        }
    });
    $(".client_slider").owlCarousel({
        loop:true,
        nav: true,
        dots:false,
        margin:35,
        items : 6,
        autoplay:true,
        controls: true,
        smartSpeed: 1500,
        navText : ["<i class='mdi mdi-arrow-left'></i>","<i class='mdi mdi-arrow-right'></i>"],
        responsiveClass:true,
        responsive:{
            800:{
                items:6,
                center: false
            },
            320:{
                items:4,
                center: false
            }
        }
    });

    <!-- For Counter Up -->
    $('.counter').counterUp({
        delay: 10,
        time: 2500
    });

    //Hide Loading Box (Preloader)
     $(window).load(function() {
        $('.loader').delay(500).fadeOut('slow');
        $('body').delay(500).css({'overflow':'visible'});
    });

    // Bootstrap selector js
    $('.selectpicker').selectpicker({
        style: 'btn-info',
        size: 4,
        showIcon: "false"
    });


    // Start Isotope
    var $grid = $('.project_item').isotope({
        itemSelector: '.element-item',
        layoutMode: 'fitRows',
        getSortData: {
        name: '.name',
        symbol: '.symbol',
        number: '.number parseInt',
        category: '[data-category]',
        weight: function( itemElem ) {
            var weight = $( itemElem ).find('.weight').text();
            return parseFloat( weight.replace( /[\(\)]/g, '') );
            }
        }
    });

    //Animate JS
    new WOW().init();

    // filter functions
    var filterFns = {
      // show if number is greater than 50
      numberGreaterThan50: function() {
        var number = $(this).find('.number').text();
        return parseInt( number, 10 ) > 50;
      },
      // show if name ends with -ium
      ium: function() {
        var name = $(this).find('.name').text();
        return name.match( /ium$/ );
      }
    };

    // bind filter button click
    $('#filters').on( 'click', 'button', function() {
      var filterValue = $( this ).attr('data-filter');
      // use filterFn if matches value
      filterValue = filterFns[ filterValue ] || filterValue;
      $grid.isotope({ filter: filterValue });
    });

    // bind sort button click
    $('#sorts').on( 'click', 'button', function() {
      var sortByValue = $(this).attr('data-sort-by');
      $grid.isotope({ sortBy: sortByValue });
    });

    // change is-checked class on buttons
    $('.button-group').each( function( i, buttonGroup ) {
      var $buttonGroup = $( buttonGroup );
      $buttonGroup.on( 'click', 'button', function() {
        $buttonGroup.find('.is-checked').removeClass('is-checked');
        $( this ).addClass('is-checked');
      });
    });
    // End Isotope

    $('#demo').dcalendarpicker();
    $('#calendar-demo').dcalendar();


})(jQuery)