require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  describe 'Associations' do
    it { should have_many(:favourites) }
    it { should have_many(:packages).through(:favourites) }
  end
end
