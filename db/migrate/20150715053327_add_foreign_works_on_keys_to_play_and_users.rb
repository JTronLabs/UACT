class AddForeignWorksOnKeysToPlayAndUsers < ActiveRecord::Migration
  def change
    add_column :plays, :user_id, :integer
      add_column :users, :play_id, :integer
  end
end
