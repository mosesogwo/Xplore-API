require 'rails_helper'

RSpec.describe Wish, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:package) }
  end
end
