$ ->
  $.fn.api.settings.debug = false
  $.fn.api.settings.api =
  'get games': '/home/game?game_id={id}'
  'get game modes': '/game_sessions/game_mode'
  'all games': '/home/all_games'
  
  $('.filter-session').api
    action: 'get games'
    stateContext: '#filter'
    dataType: 'script'
    on: 'click'
    method: 'GET'
    
  $('#all-sessions').api
    action: 'all games'
    stateContext: '#filter'
    dataType: 'script'
    on: 'click'
    method: 'GET'
    
  $('#most-played').accordion selector: trigger: '.game-title'