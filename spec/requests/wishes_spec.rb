require 'rails_helper'
RSpec.describe 'Packages', type: :request do
  let!(:packages) { create_list(:package, 10) }

  describe 'GET /wishes' do

    context 'when a user is not present' do
      it 'returns http status 500' do
        get '/api/v1/wishes'
        expect(response).to have_http_status(500)
      end
    end

    context 'when a user is present' do
      before{
        let!(:test_user) {create(:user)}
        let!(:packages) {create_list(:packages), 3}
        Wish.create(user_id: test_user.id, package_id: packages[0].id)
        Wish.create(user_id: test_user.id, package_id: packages[1].id)
        get '/api/v1/wishes' 'username'="#{test_user.username}"
      }

      it 'returns users wishlist' do
        result = JSON.parse(response.body)
        expect(result["data"].length).to eq(2)
      end
      
      it 'returns http status 200' do
        expect(response).to have_http_status(200)
      end
    end

    
    

    # it 'returns all packages with key data in json object' do
    #   result = JSON.parse(response.body)
    #   expect(result["data"].length).to eq(10)
    # end

    # it 'returns http status 200' do
    #   expect(response).to have_http_status(200)
    # end
  end

end