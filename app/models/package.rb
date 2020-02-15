class Package < ApplicationRecord
  validates :destination, :price, :details, presence: true
  validates :price, numericality: true

  has_many :wishes, dependent: :destroy
  has_many :users, through: :wishes
  has_one_attached :image
end
