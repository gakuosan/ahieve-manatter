class Post < ActiveRecord::Base
  validates :title, length: { in: 1..140}    
end