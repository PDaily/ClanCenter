# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $.fn.api.settings.api =
  'get games': '/home/game?game_id={id}'
  'get game modes': '/game_sessions/game_mode'
  
  $('.filter-session').api
    action: 'get games'
    dataType: 'script'
    on: 'click'
    method: 'GET'
    #data: game_id: $(".filter-session .item .active .selected").val()