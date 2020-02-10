require 'rails_helper'

RSpec.describe User, type: :model do
  #Validations
  it { should validate_presence_of(:full_name) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
end
