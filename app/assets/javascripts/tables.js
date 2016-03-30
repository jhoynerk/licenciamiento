//= require dataTables/jquery.dataTables.js
//= require dataTables/dataTables.bootstrap.js
//= require dataTables/dataTables.responsive.js
//= require dataTables/extras/dataTables.autoFill
//= require dataTables/extras/dataTables.colReorder
//= require dataTables/extras/dataTables.colVis
//= require dataTables/extras/dataTables.fixedColumns
//= require dataTables/extras/dataTables.fixedHeader
//= require dataTables/extras/dataTables.keyTable
//= require dataTables/extras/dataTables.scroller
//= require dataTables/dataTables.tableTools.min.js

$(document).ready(function(){
  $('.table').dataTable({
    language: { 
              "sProcessing":     "Procesando...",
              "sLengthMenu":     "Mostrar _MENU_ registros",
              "sZeroRecords":    "No se encontraron resultados",
              "sEmptyTable":     "Ningún dato disponible en esta tabla",
              "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
              "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
              "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
              "sInfoPostFix":    "",
              "sSearch":         "Buscar:",
              "sUrl":            "",
              "sInfoThousands":  ",",
              "sLoadingRecords": "Cargando...",
              "oPaginate": {
                "sFirst":    "Primero",
                "sLast":     "Último",
                "sNext":     "Siguiente",
                "sPrevious": "Anterior"
              },
              "oAria": {
                "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
              } 
    },
    'aoColumnDefs': [{ 'bSortable': false, 'aTargets': ['nosort'] }],
    buttons: [
        {
            extend: 'copy',
            text: 'Copy to clipboard'
        },
        'excel',
        'pdf'
    ]
  })  
});

