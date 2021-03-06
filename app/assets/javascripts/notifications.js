$(function(){
  toastr.options = {
    "closeButton": true,
    "debug": false,
    "progressBar": true,
    "positionClass": "toast-top-right",
    "onclick": null,
    "showDuration": "400",
    "hideDuration": "0",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  }

  if( $('#notice').text() != ''){
    var msg = $('#notice').text();
    toastr.success(msg, 'Accion ejecutada con exito');
  }

  if( $('#alert').text() != ''){
    var msg = $('#alert').text();
    toastr.error(msg, 'Lo sentimos, hubo un problema.');
  }
});

function success_notification(msg){
  toastr.success(msg, 'Accion ejecutada con exito');
}

function alert_notification(msg){
  toastr.error(msg, 'Lo sentimos, hubo un problema.');
}
