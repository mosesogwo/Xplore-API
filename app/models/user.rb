class User < ApplicationRecord
  validates :full_name, :username, presence: true
end
