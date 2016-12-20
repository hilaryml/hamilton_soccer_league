# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
team_counter = 0

10.times do

  Team.create(name: 'Team ' + "#{team_counter}")

  User.create(
    name: 'Coach ' + "#{team_counter}",
    email: 'coach' + "#{team_counter}" + '@email.com',
    password: 'coachpassword' + "#{team_counter}",
    role: 1
    )

  Game.create(
    datetime: "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}",
    location: "City Park"
  )

  Practice.create(
    datetime: "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}",
    location: "City Park"
  )

  player_counter = 0

  10.times do
    User.create(
      name: 'Player ' + "#{player_counter}",
      email: 'email' + "#{player_counter}" + '@email.com',
      password: 'password' + "#{player_counter}",
      team_id: team_counter - 1,
      role: 0
      )

    player_counter += 1
  end

  team_counter += 1
end
