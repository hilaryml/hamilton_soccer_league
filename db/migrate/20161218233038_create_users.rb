class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :team_id
      t.string :name
      t.integer :role, default: 0
    end
  end
end
