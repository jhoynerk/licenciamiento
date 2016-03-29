/*function isAbleAddFile() {
  
}

$(document).ready(function(){
  isAbleAddFile();  
  $('#save_folder').on('click', function(){
    var name = $('#name').val();
    if ($('.validate_form').valid()){
      $.post('/folders.json', { name: name }, function(data){
        $('.folder-list').append('<li><a folder_id="'+data.id+'" class="pull-right delete_folder" href="#"><i class="fa fa-times"></i></a><a href="#"><i class="fa fa-folder"></i>'+name+'</a></li>');
        $('#document_folder_id').append('<option value="'+ data.id +'">'+ name +'</option>');
        $('.close').click();
        $('#name').val('');
        $('.sk-spinner').hide();
        isAbleAddFile();
        success_notification('Carpeta añadida con exito.');
      })
    }
  });

  $('body').on('click', '.delete_folder', function(){
    var id = $(this).attr('folder_id');
    var folder = $(this);
    var r = confirm("Si elimina la carpeta, eliminara todos los archivos que se contienen en ella. ¿Esta seguro de realizar esta acción?. ");
    if (r == true) {
      $.ajax({
        type: "POST",
        url: "/folders/" + id + '.json',
        dataType: "json",
        data: {"_method":"delete"},
        success: function(data){
          $.each(data, function(index, item){
            $('.file-box[doc_id='+item+']').remove();
          })
          folder.parent().remove();
          $('#document_folder_id option[value='+id+']').remove();
          isAbleAddFile();
          success_notification('Carpeta eliminada con exito.');
        }
      });
    }
  });

  $(document).on('submit','.validate_form',function(){
    $('.sk-spinner').show('slow');
  });
});
*/
