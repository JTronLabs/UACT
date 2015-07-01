class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
        t.string :title, null: false
        t.string :description, null: false
        t.datetime :date_of_play, null: false

      t.timestamps null: false
    end
  end
end
