class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.date :date
      t.time :time
      t.string :location

      t.timestamps null: false
    end
  end
end
