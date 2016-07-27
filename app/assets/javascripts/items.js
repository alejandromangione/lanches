
var Item = {};

// Item.template = document.createElement("input");
// Item.template.setAttribute("type", "hidden");
// Item.template.setAttribute("name", "order[item_ids]");


Item.add = function(value, name) {

  var input = Item.inputTemplate();
  input.setAttribute("value", value);

  var list = Item.liTemplate();
  list.innerText = name;

  var container = document.querySelector('.items > ul');

  container.insertAdjacentElement('beforeend', input);
  container.insertAdjacentElement('beforeend', list);

}

Item.rem = function(item_id){

  document.querySelector('.items > ul > li.item-'+item_id).remove();
  document.querySelector('.items > ul > input[value="'+item_id+'"]').remove();

}

Item.inputTemplate = function(){
  var rtn;
  rtn = document.createElement("input");
  rtn.setAttribute("type", "hidden");
  rtn.setAttribute("name", "order[item_ids][]");
  
  return rtn;
}

Item.liTemplate = function(){
  var rtn;
  rtn = document.createElement("li");
  
  return rtn;
}