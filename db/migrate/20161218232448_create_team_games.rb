class CreateTeamGames < ActiveRecord::Migration
  def change
    create_table :team_games do |t|
      t.references :team, index: true
      t.references :game, index: true

      t.timestamps null: false
    end
    add_foreign_key :team_games, :teams
    add_foreign_key :team_games, :games
  end
end
