class User < ActiveRecord::Base

  has_many :items
  validates :username, :email, presence: true

  has_secure_password

end
