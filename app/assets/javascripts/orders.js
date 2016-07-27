$(document).on('turbolinks:load', function() {

  $('#add-item').click(function(){

    var id = $("#item").val();
    var name = $( "#item option:selected" ).text();

    Item.add(id, name);


  });

  $('#remove-item').click(function(){

    var id = $("#item").val();

    Item.rem(id);

  });


})