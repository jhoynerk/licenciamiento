function wizard2Id(){$(".wizard2").prop("id").split("_")[2]}var validateSetupBasic={errorPlacement:function(e,t){var i=$(t).data("error-target-after");void 0!=i?$(i).after(e):t.after(e)},rules:{"employee[email]":{required:!0,email:!0,remote:{url:"/employees/check_validation",type:"post",data:{id:function(){return $("#employee_id").val()}}}},"employee[rut]":{required:!0,remote:{url:"/employees/check_validation",type:"post",data:{id:function(){return $("#employee_id").val()}}}},"employee[company_attributes][rut]":{required:!0,remote:{url:"/companies/check_validation",type:"post",data:{id:function(){return $("#company_id").val()}}}}},messages:{"employee[email]":{remote:"Este email ya est\xe1 registrado."},"employee[rut]":{remote:"Este rut ya est\xe1 registrado."},"employee[company_attributes][rut]":{remote:"Este rut ya est\xe1 registrado."}}};$(function(){var e=$(".wizard2").steps({bodyTag:"fieldset",onStepChanging:function(t,i,a){if(i>a)return!0;var r=$(this);return a>i&&($(".body:eq("+a+") label.error",r).remove(),$(".body:eq("+a+") .error",r).removeClass("error")),2==i?e.validate().settings.ignore=":disabled,:hidden:not(.chosen-select)":e.validate().settings.ignore=":disabled,:hidden",e.valid()},onStepChanged:function(e,t,i){2===t&&3===i&&4===i&&$(this).steps("previous")},onFinishing:function(){$(this);return e.valid()},onFinished:function(){var e=$(this);e.submit()},enableCancelButton:!1,labels:{cancel:"Cancelar",current:"Paso Actual:",pagination:"Paginacion",finish:"Fin",next:"Siguiente",previous:"Anterior",loading:"Cargando ..."}});$(".wizard2").length>0&&($(".wizard2").validate(validateSetupBasic).settings.ignore=":disabled,:hidden",setTimeout(function(){$(".chosen-select2").chosen({max_selected_options:5,width:"100%"})},2e3))});