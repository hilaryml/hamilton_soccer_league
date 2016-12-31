team_counter = 0

6.times do

  Team.create(name: 'Team ' + "#{team_counter + 1}", wins: team_counter)

  User.create(
    name: 'Coach ' + "#{team_counter + 1}",
    email: 'coach' + "#{team_counter + 1}" + '@email.com',
    password: 'coachpassword' + "#{team_counter + 1}",
    team_id: team_counter + 1,
    role: 1
    )

  player_counter = 0

  10.times do
    User.create(
      name: 'Player ' + "#{player_counter + 1}",
      email: 'email' + "#{player_counter + 1}" + '@email.com',
      password: 'password' + "#{player_counter + 1}",
      team_id: team_counter + 1,
      role: 0
      )

    player_counter += 1
  end

  team_counter += 1
end

TeamGame.create(team_id: 1, game_id: 1)
TeamGame.create(team_id: 2, game_id: 1)
Game.create(date: Date.today, time: Time.now, location: "City Park")

TeamGame.create(team_id: 3, game_id: 2)
TeamGame.create(team_id: 4, game_id: 2)
Game.create(date: Date.tomorrow, time: Time.now, location: "City Park")

TeamGame.create(team_id: 5, game_id: 3)
TeamGame.create(team_id: 6, game_id: 3)
Game.create(date: Date.yesterday, time: Time.now, location: "City Park")

TeamPractice.create(team_id: 1, practice_id: 1)
Practice.create(date: Date.tomorrow, time: Time.now, location: "City Park")

TeamPractice.create(team_id: 2, practice_id: 2)
Practice.create(date: Date.yesterday, time: Time.now, location: "City Park")

TeamPractice.create(team_id: 3, practice_id: 3)
Practice.create(date: Date.today, time: Time.now, location: "City Park")

TeamPractice.create(team_id: 4, practice_id: 4)
Practice.create(date: Date.today, time: Time.now, location: "City Park")

TeamPractice.create(team_id: 5, practice_id: 5)
Practice.create(date: Date.tomorrow, time: Time.now, location: "City Park")

TeamPractice.create(team_id: 6, practice_id: 6)
Practice.create(date: Date.tomorrow, time: Time.now, location: "City Park")

Comment.create(user_id: 1, game_id: 1)
Comment.create(user_id: 2, game_id: 1)
