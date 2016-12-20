class CreateTeamPractices < ActiveRecord::Migration
  def change
    create_table :team_practices do |t|
      t.references :team, index: true
      t.references :practice, index: true

      t.timestamps null: false
    end
    add_foreign_key :team_practices, :teams
    add_foreign_key :team_practices, :practices
  end
end
