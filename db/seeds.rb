# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{ email: 'guy@guy.com', password: 'changeme', user_name: 'dinklebot', xbox_name: 'dinklebot', time_zone: 'Eastern Time (US & Canada)' },{ email: 'example@guy.com', password: 'changeme', user_name: 'tinktink', xbox_name: 'dinklebot', time_zone: 'Eastern Time (US & Canada)' }])

minecraft = Game.create(title: 'Minecraft', description: 'Blocks!')
minecraft.game_modes.create(title: "Survival", game: Game.find_by(title: "Minecraft"), total_players: 6)

destiny = Game.create(title: 'Destiny', description: 'Shoot things!')
destiny.game_modes.create(title: "Patrol", game: Game.find_by(title: "Destiny"), total_players: 3)
destiny.game_modes.create(title: "Weekly Nightfall Strike", game: Game.find_by(title: "Destiny"), total_players: 3)
