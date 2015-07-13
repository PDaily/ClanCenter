# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#game_mode_select').dropdown()
 
  $('#games_select').dropdown transition: 'slide down'
  
  $('#games_select').on 'change', ->
    $.ajax '/gamesessions/update_games',
    type: 'GET'
    dataType: 'script'
    data: {
      game_id: $("#games_select option:selected").val()
    }
    error: (jqXHR, textStatus, errorThrown) ->
      console.log("Error: #{textStatus}")
    success: () ->
      text = $("#game_mode_select option:selected").text()
      $('#game_mode_select').dropdown('set text', text)
