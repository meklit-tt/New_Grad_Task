class Restaurant < ApplicationRecord

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  belongs_to :user, optional: true
  belongs_to :category
  has_many :reviews
  has_attached_file :rest_img, styles: { rest_index: "250x300>", rest_show: "325x400>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :rest_img, content_type: /\Aimage\/.*\z/


  paginates_per 3
end
