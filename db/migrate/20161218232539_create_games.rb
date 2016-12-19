class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :datetime
      t.string :location

      t.timestamps null: false
    end
  end
end
