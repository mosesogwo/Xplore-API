class User < ApplicationRecord
  validates :full_name, :username, presence: true
  validates :username, uniqueness: true

  has_many :wishes
  has_many :packages, through: :wishes
end
