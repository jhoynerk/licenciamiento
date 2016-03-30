/*
 *
 *   INSPINIA - Responsive Admin Theme
 *   version 2.0
 *
 */

 function id_user () {
    return $('.validate_form ').prop('id').split('_')[2];
 }

$(function(){
  $('[data-toggle="tooltip"]').tooltip();
});

$(document).ready(function () {
    $(".chosen-select").chosen({
      max_selected_options: 5,
      width: "100%"
    });

    $('#employee_agreement').on('change', function(){
      if ($(this).val() == "2"){
        $('#date-contract').removeClass('hide');
      }else{
        $('#date-contract').addClass('hide');
        $('#employee_contract_end_date').val('');
      }
    });

    $('.rut').Rut({
      format_on: 'keyup'
    });

if($(".validate_form").length>0){
    $(".validate_form").validate({
        errorPlacement: function (error, element) {
          var target = $(element).data('error-target-after');
          if(target != undefined){
            $(target).after(error);
          }else{
            element.after(error);
          }
        },
        rules: {
            'user[current_password]': {
              minlength: 8,
              required: true
            },
            'user[password]': {
              minlength: 8,
              required: true
            },
            'user[password_confirmation]':{
              minlength: 8,
              required: true,
              equalTo: 'input[name="user[password]"]'
            },
            'user[email]': {
                required: true,
                email: true,
                remote: {
                    url: "/users/check_validation",
                    type: "post",
                    data: {
                      id: function() {
                        return id_user();
                      }
                    }
                }
            }
        },
        messages: {
            'user[email]': {
                remote: "Este email ya está registrado."
            }
        }
    }).settings.ignore = ":disabled,:hidden:not(.chosen-select)";
}


    $('.validate_form').on('keyup keypress', function(e) {
      var keyCode = e.keyCode || e.which;
      if (keyCode === 13) {
        e.preventDefault();
        return false;
      }
    });

    $.validator.addMethod("rut", function(value, element) {
      return this.optional(element) || $.Rut.validar(value);
    }, "Este campo debe ser un rut valido.");

    $.validator.addMethod("validDate", function(value, element) {
        return this.optional(element) || moment(value,"DD-MM-YYYY").isValid();
    }, "Por favor ingrese una fecha validad (DD-MM-YYYY)");

    var map = $(".map_address_company").geocomplete({map: ".map_canvas", location:'Santiago, Chile'});
    $(".map_address_company").trigger("geocode");

    // Add body-small class if window less than 768px
    if ($(this).width() < 769) {
        $('body').addClass('body-small')
    } else {
        $('body').removeClass('body-small')
    }

    $('.salary').on('change', function(){
      var amount = $(this).val();
      var amount = amount.replace(/\./g, "");
      $('#employee_salary').val(amount);
      $(this).val(addCommas(amount));
    });

    // MetsiMenu
    $('#side-menu').metisMenu();

    $(".datepicker").datepicker({
        format:'dd-mm-yyyy',
        todayBtn: "linked",
        calendarWeeks: true,
        language: 'es',
        autoclose: true,
        keyboardNavigation: false,
        forceParse: false
    });

    // Collapse ibox function
    $('.collapse-link').click( function() {
        var ibox = $(this).closest('div.ibox');
        var button = $(this).find('i');
        var content = ibox.find('div.ibox-content');
        content.slideToggle(200);
        button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
        ibox.toggleClass('').toggleClass('border-bottom');
        setTimeout(function () {
            ibox.resize();
            ibox.find('[id^=map-]').resize();
        }, 50);
    });

    // Close ibox function
    $('.close-link').click( function() {
        var content = $(this).closest('div.ibox');
        content.remove();
    });

    // Close menu in canvas mode
    $('.close-canvas-menu').click( function() {
        $("body").toggleClass("mini-navbar");
        SmoothlyMenu();
    });

    // Open close right sidebar
    $('.right-sidebar-toggle').click(function(){
        $('#right-sidebar').toggleClass('sidebar-open');
    });

    // Initialize slimscroll for right sidebar
    $('.sidebar-container').slimScroll({
        height: '100%',
        railOpacity: 0.4,
        wheelStep: 10
    });

    // Open close small chat
    $('.open-small-chat').click(function(){
        $(this).children().toggleClass('fa-comments').toggleClass('fa-remove');
        $('.small-chat-box').toggleClass('active');
    });

    // Initialize slimscroll for small chat
    $('.small-chat-box .content').slimScroll({
        height: '234px',
        railOpacity: 0.4
    });

    // Small todo handler
    $('.check-link').click( function(){
        var button = $(this).find('i');
        var label = $(this).next('span');
        button.toggleClass('fa-check-square').toggleClass('fa-square-o');
        label.toggleClass('todo-completed');
        return false;
    });

    // Minimalize menu
    $('.navbar-minimalize').click(function () {
        $("body").toggleClass("mini-navbar");
        SmoothlyMenu();

    });

    // Tooltips demo
    $('.tooltip-demo').tooltip({
        selector: "[data-toggle=tooltip]",
        container: "body"
    });

    // Move modal to body
    // Fix Bootstrap backdrop issu with animation.css
    $('.modal').appendTo("body");

    // Full height of sidebar
    function fix_height() {
        var heightWithoutNavbar = $("body > #wrapper").height() - 61;
        $(".sidebard-panel").css("min-height", heightWithoutNavbar + "px");

        var navbarHeigh = $('nav.navbar-default').height();
        var wrapperHeigh = $('#page-wrapper').height();

        if(navbarHeigh > wrapperHeigh){
            $('#page-wrapper').css("min-height", navbarHeigh + "px");
        }

        if(navbarHeigh < wrapperHeigh){
            $('#page-wrapper').css("min-height", $(window).height()  + "px");
        }

        if ($('body').hasClass('fixed-nav')) {
            $('#page-wrapper').css("min-height", $(window).height() - 60 + "px");
        }

    }
    fix_height();

    // Fixed Sidebar
    $(window).bind("load", function () {
        if ($("body").hasClass('fixed-sidebar')) {
            $('.sidebar-collapse').slimScroll({
                height: '100%',
                railOpacity: 0.9
            });
        }
    })

    // Move right sidebar top after scroll
    $(window).scroll(function(){
        if ($(window).scrollTop() > 0 && !$('body').hasClass('fixed-nav') ) {
            $('#right-sidebar').addClass('sidebar-top');
        } else {
            $('#right-sidebar').removeClass('sidebar-top');
        }
    });

    $(window).bind("load resize scroll", function() {
        if(!$("body").hasClass('body-small')) {
            fix_height();
        }
    });

    $("[data-toggle=popover]")
        .popover();

    // Add slimscroll to element
    $('.full-height-scroll').slimscroll({
        height: '100%'
    })
});


// Minimalize menu when screen is less than 768px
$(window).bind("resize", function () {
    if ($(this).width() < 769) {
        $('body').addClass('body-small')
    } else {
        $('body').removeClass('body-small')
    }
});

// For demo purpose - animation css script
function animationHover(element, animation){
    element = $(element);
    element.hover(
        function() {
            element.addClass('animated ' + animation);
        },
        function(){
            //wait for animation to finish before removing classes
            window.setTimeout( function(){
                element.removeClass('animated ' + animation);
            }, 2000);
        });
}

function SmoothlyMenu() {
    if (!$('body').hasClass('mini-navbar') || $('body').hasClass('body-small')) {
        // Hide menu in order to smoothly turn on when maximize menu
        $('#side-menu').hide();
        // For smoothly turn on menu
        setTimeout(
            function () {
                $('#side-menu').fadeIn(500);
            }, 100);
    } else if ($('body').hasClass('fixed-sidebar')) {
        $('#side-menu').hide();
        setTimeout(
            function () {
                $('#side-menu').fadeIn(500);
            }, 300);
    } else {
        // Remove all inline style from jquery fadeIn function to reset menu state
        $('#side-menu').removeAttr('style');
    }
}

function addCommas(n){
    var rx=  /(\d+)(\d{3})/;
    return String(n).replace(/^\d+/, function(w){
        while(rx.test(w)){
            w= w.replace(rx, '$1.$2');
        }
        return w;
    });
}
