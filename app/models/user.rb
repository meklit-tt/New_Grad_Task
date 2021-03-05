class User < ApplicationRecord
has_many :restaurants
has_many :reviews
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



end
