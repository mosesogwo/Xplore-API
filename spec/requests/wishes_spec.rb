require 'rails_helper'

RSpec.describe 'Packages', type: :request do

  let!(:packages) { create_list(:package, 10) }

  describe 'GET /wishes' do

    context 'when no user is logged in' do
      it 'returns http status 500' do
        get '/api/v1/wishes'
        expect(response).to have_http_status(500)
      end
    end

    context 'when a user is logged in' do
      let!(:test_user) {create(:user)}
      let!(:packages) { create_list(:package, 3)}
      before{
        Wish.create(user_id: test_user.id, package_id: packages[0].id)
        Wish.create(user_id: test_user.id, package_id: packages[1].id)
        valid_attributes = {}
        get '/api/v1/wishes', params: {username: test_user.username}
      }

      it 'returns users wishlist' do
        result = JSON.parse(response.body)
        expect(result["data"].length).to eq(2)
      end
      
      it 'returns http status 200' do
        expect(response).to have_http_status(200)
      end
    end
 
    
  end

  describe 'POST /wishes' do

    context 'no user is logged in' do
      let!(:test_user) {create(:user)}
      let!(:packages) { create_list(:package, 3)}

      it 'returns http status 500' do
        post '/api/v1/wishes', params: {id: packages[0].id}
        expect(response).to have_http_status(500)
      end
    end

    context 'a user is logged in' do 
      let!(:test_user) {create(:user)}
      let!(:packages) {create_list(:package, 3)}
      before{
        post "/api/v1/wishes", params: {username: test_user.username, id: packages[0].id}
      }

      it "adds package to the user's wish list" do
        result = JSON.parse(response.body)
        expect(result["message"]).to match(/Added to Wishes/)
      end

      it 'returns http status 200' do
        expect(response).to have_http_status(200)
      end

    end
  end
end