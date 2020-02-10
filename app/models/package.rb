class Package < ApplicationRecord
  validates :destination, :price, :details, presence: true
  validates :price, numericality: true

  has_many :wishes
  has_many :users, through: :wishes
  has_many_attached :images
end
