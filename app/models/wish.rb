class Wish < ApplicationRecord
  validates_uniqueness_of :package, scope: :user

  belongs_to :user
  belongs_to :package
end
