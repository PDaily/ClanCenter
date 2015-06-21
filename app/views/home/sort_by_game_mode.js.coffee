$("#game-card").empty()
  .append("<%= escape_javascript(render(:partial => @game_sessions)) %>")