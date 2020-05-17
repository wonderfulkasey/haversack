class CreateSavedItems < ActiveRecord::Migration
  def change
    create_table :saved_items do |t|
          t.integer :user_id
          t.integer :item_id
        end
  end
end
