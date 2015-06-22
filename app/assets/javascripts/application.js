// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require semantic_ui/semantic_ui
//= require turbolinks
//= require local_time
//= require home
//= require users
//= require game_sessions
//= require games

var ready;
ready = function() {
  $('.dropdown').dropdown({transition: 'drop'});
  $('#main-menu').on('click', function () {
    $('#side-menu').sidebar('toggle');
  });
	$('.message .close').on('click', function() {
		$(this).closest('.message').fadeOut();
	});
	console.log("Page loaded!")
};

$(document).ready(ready);
$(document).on('page:load', ready);