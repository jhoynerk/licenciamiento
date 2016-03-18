//= require dataTables/jquery.dataTables.js
//= require dataTables/dataTables.bootstrap.js
//= require dataTables/dataTables.responsive.js
//= require dataTables/dataTables.tableTools.min.js

$('.table').dataTable({
  language: {
    url: '//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json'
  },
  'aoColumnDefs': [{
                    'bSortable': false,
                    'aTargets': ['nosort']
                  }]
})
