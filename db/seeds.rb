# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{ email: 'guy@guy.com', password: 'changeme', user_name: 'dinklebot' },{ email: 'example@guy.com', password: 'changeme', user_name: 'tinktink' }])
games = Game.create([{ title: 'Minecraft', description: 'Blocks!' }, { title: 'Destiny', description: 'Shoot things!' }])
game_modes = GameMode.create([{title: "Survival", game: Game.find_by(title: "Minecraft"), total_players: 6}, {title: "Patrol", game: Game.find_by(title: "Destiny"), total_players: 3}])