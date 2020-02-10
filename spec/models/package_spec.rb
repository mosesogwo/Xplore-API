require 'rails_helper'

RSpec.describe Package, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:destination) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:details) }
  end

  describe 'Associations' do
    it { should have_many(:wishes) }
    it { should have_many(:users).through(:wishes) }
    it { should have_many_attached(:images) }
  end
end
