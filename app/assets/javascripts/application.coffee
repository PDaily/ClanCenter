#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require semantic_ui/semantic_ui
#= require turbolinks
#= require local_time
#= require table-sort
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
    .click ->
      $(this).popup 'remove popup'
    
  $('#menu-game').popup({
    content: "Game Pages"
    })
    .click ->
      $(this).popup 'remove popup'
      
  $('#menu-msgs').popup({
    content: "Messages"
    })
    .click ->
      $(this).popup 'remove popup'
      
  $('#menu-user').popup({
    content: "User Menu"
    position: "bottom right"
    })
    .click ->
      $(this).popup 'remove popup'
      
$(document).ready ready

