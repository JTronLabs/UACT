class CreateWorksOns < ActiveRecord::Migration
  def change
    create_table :works_ons do |t|
        t.string :student_role, null: false

      t.timestamps null: false
    end
  end
end
