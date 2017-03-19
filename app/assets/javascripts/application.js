// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
//= require bxslider
//= require bootstrap-datepicker
//= require toastr

jQuery(document).ready(function($){

  document.addEventListener("turbolinks:load", function() {
    if($('.bxslider').length > 0){
      $('.bxslider').bxSlider({
        auto: true,
      });
    }
  })

  var top = jQuery('.menu-nav').offset().top - parseFloat(jQuery('.menu-nav').css('margin-top').replace(/auto/, 0));
  jQuery(window).scroll(function (event) {
    if (jQuery(this).scrollTop() >= top) {
      jQuery('.menu-nav').css({
        'position': 'fixed',
        'top': 0,
        'z-index': 999
      });
    } else {
        jQuery('.menu-nav').css({
          'position': 'relative',
          'top': 0,
          'z-index': 999
        });
      }
  });
});


$(document).ready(function() {
  toastr.options = {
    "closeButton": false,
    "debug": false,
    "positionClass": "toast-bottom-right",
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  }
});
