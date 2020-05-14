class Item < ActiveRecord::Base

  belongs_to :user

  validates :title, :character, :description, :date, presence: true

end
