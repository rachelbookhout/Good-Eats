class Review < ActiveRecord::Base
  belongs_to :restaurant
  validates :body, presence:true
  validates :rating, :inclusion => 1..5, presence:true
end
