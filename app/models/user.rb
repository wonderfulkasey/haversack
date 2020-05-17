class User < ActiveRecord::Base

  has_many :items
  validates :user, :email, presence: true

  has_secure_password

end
