$(".game-cards").empty()
<% @game_sessions.each do |game_session| %>
  .append("<%= escape_javascript(render(:partial => @game_sessions)) %>")
<% end %>