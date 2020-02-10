class User < ApplicationRecord
  validates :full_name, :username, presence: true
  validates :username, uniqueness: true
end
