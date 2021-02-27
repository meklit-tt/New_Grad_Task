class User < ApplicationRecord
has_many :restaurants
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
