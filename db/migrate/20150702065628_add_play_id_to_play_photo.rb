class AddPlayIdToPlayPhoto < ActiveRecord::Migration
  def change
    add_column :play_photos, :play_id, :integer
  end
end
