class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.datetime :datetime
      t.string :location

      t.timestamps null: false
    end
  end
end
