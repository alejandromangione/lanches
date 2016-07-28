$(document).ready(function(){

  $('#add-item').click(function(){

    var id = $("#item").val();
    var name = $( "#item option:selected" ).text();

    Item.add(id, name);


  });

  $('#remove-item').click(function(){

    var id = $("#item").val();

    Item.rem(id);

  });


 $('#add-label').click(function(){

    var id = $("#label").val();
    var name = $( "#label option:selected" ).text();

    Label.add(id, name);


  });

  $('#remove-label').click(function(){

    var id = $("#label").val();

    Label.rem(id);

  });


})