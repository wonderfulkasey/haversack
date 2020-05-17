class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :title
      t.text  :description
      t.string  :character
      t.integer :user_id
    end
  end
end
