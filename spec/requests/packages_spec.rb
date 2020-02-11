require 'rails_helper'
RSpec.describe 'Packages', type: :request do
  let!(:packages) { create_list(:package, 10) }

  describe 'GET /packages' do
    before {get '/packages' }
    it 'returns all packages with key data in json object' do
      data = response.json().data
      expect(data.size).to eq(10)
    end

    it 'returns http status 200' do
      expect (response).to have_http_status(200)
    end


  end
end