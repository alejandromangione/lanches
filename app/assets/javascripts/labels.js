
var Label = {};


Label.add = function(value, name) {

  var input = Label.inputTemplate();
  input.setAttribute("value", value);

  var list = Label.liTemplate();
  list.innerText = name;

  var container = document.querySelector('.labels > ul');

  container.insertAdjacentElement('beforeend', input);
  container.insertAdjacentElement('beforeend', list);

}

Label.rem = function(label_id){

  document.querySelector('.labels > ul > li.label-'+label_id).remove();
  document.querySelector('.labels > ul > input[value="'+label_id+'"]').remove();

}

Label.inputTemplate = function(){
  var rtn;
  rtn = document.createElement("input");
  rtn.setAttribute("type", "hidden");
  rtn.setAttribute("name", "order[label_ids][]");
  
  return rtn;
}

Label.liTemplate = function(){
  var rtn;
  rtn = document.createElement("li");
  
  return rtn;
}