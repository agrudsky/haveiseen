class User < ActiveRecord::Base
  has_many :watches
  
  has_secure_password
end
