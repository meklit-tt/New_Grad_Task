class Review < ApplicationRecord

  validates :rating, presence: true
  validates :comment, presence: true
  belongs_to :restaurant
  belongs_to :user
  

validates_uniqueness_of :user_id, :scope => :restaurant_id, :message=>"You can't make a review  more than once", on: 'create'
end
