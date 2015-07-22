class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
        t.string :title, null: false
        t.string :description, null: false
        t.datetime :date_of_play, null: false
        t.string :profile_image#, null:false
        t.string :pictures #array of images. Will be used for uploading pictures of the play in when performed

      t.timestamps null: false
    end
  end
end
