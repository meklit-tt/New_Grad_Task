class User < ApplicationRecord
has_many :restaurants
has_many :reviews
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
validates :admin,  inclusion: {in: [ true ,  false ]}

#before_destroy :not_destroy_admin


end
