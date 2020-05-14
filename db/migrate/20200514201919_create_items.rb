class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :title
      t.string  :description
      t.date  :date
      t.string  :character
      t.integer  :user_id
    end
  end
end
