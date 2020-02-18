class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :wishes
  has_many :packages, through: :wishes
end
