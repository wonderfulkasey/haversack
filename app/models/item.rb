class Item < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :title, :character, :description, :date, presence: true
end
