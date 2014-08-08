class Movie < ActiveRecord::Base
  has_many :watches
end
