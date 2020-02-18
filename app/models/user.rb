class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :wishes, dependent: :destroy
  has_many :packages, through: :wishes
end
