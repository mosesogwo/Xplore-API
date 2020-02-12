require 'rails_helper'

RSpec.describe Package, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:destination) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:details) }
    it { should validate_numericality_of(:price) }
  end

  describe 'Associations' do
    it { should have_many(:wishes) }
    it { should have_many(:users).through(:wishes) }
  end

  describe 'Attachments' do
    subject { build :package }

    it { expect(subject.images).to be_attached }
  end
end
