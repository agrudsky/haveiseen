class User < ActiveRecord::Base
  belongs_to :watch
  
  has_secure_password
end
