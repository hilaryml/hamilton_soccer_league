class CreateGameUsers < ActiveRecord::Migration
  def change
    create_table :game_users do |t|
      t.references :user, index: true
      t.references :game, index: true

      t.timestamps null: false
    end
    add_foreign_key :game_users, :users
    add_foreign_key :game_users, :games
  end
end
