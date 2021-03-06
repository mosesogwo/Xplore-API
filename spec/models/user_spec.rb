require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  describe 'Associations' do
    it { should have_many(:wishes) }
    it { should have_many(:packages).through(:wishes) }
  end
end
