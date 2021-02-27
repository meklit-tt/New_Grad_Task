class Restaurant < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews
  has_attached_file :rest_img, styles: { rest_index: "250x300>", rest_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :rest_img, content_type: /\Aimage\/.*\z/
end
