// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

function likeEvent(e) {
  var target = e.target;
  var value = target.value;
  if ( target.classList.contains('active') ){
    target.classList.remove('active');
    target.blur();
  }

  else{
    target.classList.add('active');
    target.blur();
  }
  var result
  $.ajax({
          type: "POST",
          url: "ajaxFunction",
          data: {
          "document_id" : value
          },
          datatype: 'json',
          success: function(json){
            likes = json["likes"]
            console.log("the value of x is:", json["hola"]);
            target.innerHTML = likes;
          }
      })
}
