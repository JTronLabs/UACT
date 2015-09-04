class CreateEditablePages < ActiveRecord::Migration
  def change
    create_table :editable_pages do |t|
        t.string :classification, null: false
        t.string :title
        t.string :body, null: false
      t.timestamps null: false
    end
  end
end
