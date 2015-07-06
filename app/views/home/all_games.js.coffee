$(".game-cards").empty()
  .append("<%= escape_javascript(render(partial: 'home/game_session_cards')) %>")