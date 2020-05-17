class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :title
      t.text  :description
      t.date  :date
      t.string  :character
      t.integer  :user_id
    end
  end
end
