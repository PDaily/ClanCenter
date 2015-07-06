#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require semantic_ui/semantic_ui
#= require turbolinks
#= require local_time
#= require home
#= require users
#= require game_sessions
#= require games

ready = ->
  $('.dropdown').dropdown transition: 'drop'
  $('#main-menu').on 'click', ->
    $('#side-menu').sidebar 'toggle'

  $('.message .close').on 'click', ->
    $(this).closest('.message').fadeOut(400)
  
  $('.flash').delay(2400).fadeOut(400)
  
  $('#menu-home').popup({
    content: "Go Home!"
    })
    
  $('#menu-game').popup({
    content: "Game Pages"
    })
    
  $('#menu-msgs').popup({
    content: "Messages"
    })
    
  $('#menu-user').popup({
    content: "User Menu"
    position: "bottom right"
    })

$(document).ready ready

