json.array!(@games) do |game|
  json.extract! game, :id, :game_title, :game_desc, :game_mode, :total_players
  json.url game_url(game, format: :json)
end
