class CreatePlayPhotos < ActiveRecord::Migration
  def change
    create_table :play_photos do |t|
        t.string   "image"
        t.datetime "created_at"
        t.datetime "updated_at"

      t.timestamps null: false
    end
  end
end
