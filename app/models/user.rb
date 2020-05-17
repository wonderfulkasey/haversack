class User < ActiveRecord::Base

     validates_presence_of :username, :email
     validates_uniqueness_of :username, :email
     has_secure_password

  has_many :items
end
