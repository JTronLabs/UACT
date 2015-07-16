class CreateWorksOns < ActiveRecord::Migration
  def change
    create_table :works_ons do |t|
      t.string :student_role #, null: false
    
      t.integer :play_id, null:false
      t.integer :user_id, null:false

      t.timestamps null: false
    end
  end
end
