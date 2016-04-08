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
//= require jquery/jquery-2.1.1.js
//= require dataTables/jquery.dataTables
//= require bootstrap-sprockets
//= require metisMenu/jquery.metisMenu.js
//= require pace/pace.min.js
//= require toastr/toastr.min.js
//= require notifications.js
//= require j-geocomplete/jquery.geocomplete.min.js
//= require peity/jquery.peity.min.js
//= require slimscroll/jquery.slimscroll.min.js
//= require switchery/switchery.js
//= require cropper/cropper.min.js
//= require iCheck/icheck.min.js
//= require staps/jquery.steps.min.js
//= require validate/jquery.validate.min.js
//= require datapicker/bootstrap-datepicker.js
//= require datapicker/bootstrap-datepicker.es.js
//= require validate/localization/messages_es.js
//= require jasny/jasny-bootstrap.min.js
//= require jquery.Rut.min.js
//= require chosen/chosen.jquery.js
//= require fullcalendar/moment.min.js
//= require fullcalendar/fullcalendar.min.js
//= require jit.js
//= require excanvas.js
//= require inspinia.js
//= require jquery.printelement.js
$(function(){
  $.validator.addMethod("RIF", function(value, element) {
    return this.optional(element) || /^([V|E|G|J|P|N]{1}-\d{7,10})*$/i.test(value);
  }, "El RIF o Cédula es inválido: Por favor ingresa uno válido. Formato: V-XXXXXXX");

  $.validator.addMethod("telefono", function(value, element) {
    return this.optional(element) || /^0(412|416|414|424|426|212)-\d{7}$/i.test(value);
  }, "El teléfono es inválido: Por favor ingresa uno válido. Format: 0212-0123456");
});
