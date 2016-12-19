class CreatePracticeUsers < ActiveRecord::Migration
  def change
    create_table :practice_users do |t|
      t.references :user, index: true
      t.references :practice, index: true

      t.timestamps null: false
    end
    add_foreign_key :practice_users, :users
    add_foreign_key :practice_users, :practices
  end
end
