var validateSetupBasic = {
    errorPlacement: function (error, element) {
      var target = $(element).data('error-target-after');
      if(target != undefined){
        $(target).after(error);
      }else{
        element.after(error);
      }
  },

  rules: {
    'employee[email]': {
      required: true,
      email: true,
      remote: {
        url: "/employees/check_validation",
        type: "post",
        data: {
          id: function() {
            return $('#employee_id').val();
          }
        }
      }
    },
    'employee[rut]': {
      required: true,
      remote: {
        url: "/employees/check_validation",
        type: "post",
        data: {
          id: function() {
            return $('#employee_id').val();
          }
        }
      }
    },
    'employee[company_attributes][rut]': {
      required: true,
      remote: {
        url: "/companies/check_validation",
        type: "post",
        data: {
          id: function() {
            return $('#company_id').val();
          }
        }
      }
    }
  },
  messages: {
    'employee[email]': {
      remote: "Este email ya está registrado."
    },
    'employee[rut]': {
      remote: "Este rut ya está registrado."
    },
    'employee[company_attributes][rut]': {
      remote: "Este rut ya está registrado."
    }
  }
}

function wizard2Id () {
  $('.wizard2').prop('id').split('_')[2];
}


$(function(){
  var wizard = $(".wizard2").steps({
    bodyTag: "fieldset",
    onStepChanging: function (event, currentIndex, newIndex) {
        // Always allow going backward even if the current step contains invalid fields!
        if (currentIndex > newIndex) {
            return true;
        }

        var form = $(this);

        // Clean up if user went backward before
        if (currentIndex < newIndex) {
            // To remove error styles
            $(".body:eq(" + newIndex + ") label.error", form).remove();
            $(".body:eq(" + newIndex + ") .error", form).removeClass("error");
        }

        // Disable validation on fields that are disabled or hidden.
        // form.validate(validateSetupBasic)

        // Start validation; Prevent going forward if false
        if(currentIndex == 2){
          wizard.validate().settings.ignore = ":disabled,:hidden:not(.chosen-select)";
        }else{
          wizard.validate().settings.ignore = ":disabled,:hidden";
        }
        
        return wizard.valid();
    },
    onStepChanged: function (event, currentIndex, priorIndex) {

        // Suppress (skip) "Warning" step if the user is old enough and wants to the previous step.
        if (currentIndex === 2 && priorIndex === 3 && priorIndex === 4) {
            $(this).steps("previous");
        }
    },
    onFinishing: function (event, currentIndex) {
        var form = $(this);

        // Disable validation on fields that are disabled.
        // At this point it's recommended to do an overall check (mean ignoring only disabled fields)
        // form.validate(validateSetupBasic).settings.ignore = ":disabled,:hidden";

        // Start validation; Prevent form submission if false
        return wizard.valid();
    },
    onFinished: function (event, currentIndex) {
        var form = $(this);

        // Submit form input
        form.submit();
    },
    enableCancelButton: false,
    labels: {
      cancel: "Cancelar",
      current: "Paso Actual:",
      pagination: "Paginacion",
      finish: "Fin",
      next: "Siguiente",
      previous: "Anterior",
      loading: "Cargando ..."
    }});


    
    if($(".wizard2").length>0){
      $(".wizard2").validate(validateSetupBasic).settings.ignore = ":disabled,:hidden";
      setTimeout( function() {
        $(".chosen-select2").chosen({
          max_selected_options: 5,
          width: "100%"
        });
      }, 2000 );
    }

});

