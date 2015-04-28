$("#game_mode_select").empty()
  .append("<%= escape_javascript(render(:partial => @game_modes)) %>")