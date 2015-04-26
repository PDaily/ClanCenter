# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create({ email: 'guy@guy.com', password: 'changeme', user_name: 'dinklebot' })
games = Game.create([{ game_title: 'Minecraft', game_desc: 'Blocks!', game_mode: 'Survival', total_players: 4 }, { game_title: 'Destiny', game_desc: 'Shoot things!', game_mode: 'Patrol', total_players: 3 }])