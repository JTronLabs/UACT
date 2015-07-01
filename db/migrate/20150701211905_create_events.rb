class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.datetime :date_and_time_of_event, null: false

      t.timestamps null: false
    end
  end
end
