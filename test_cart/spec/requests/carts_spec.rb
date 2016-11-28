require 'rails_helper'

RSpec.describe "Carts", type: :request do



  describe "GET /carts" do

    let!(:carts) { create_list :cart, rand(5..10)}

    it 'responds with :ok' do
      get carts_path, headers: headers, as: :json
      expect(response).to have_http_status(:ok)
    end

    it 'responds with a list' do
      get carts_path, headers: headers, as: :json
      expect(json_api_response).to be_a(Array)
    end

    it 'responds with a correct list' do
      get carts_path, headers: headers, as: :json
      expect(json_api_response.size).to eq(carts.count)
      expect(carts.map(&:id)).to include(json_api_response.first['id'])
      expect(json_api_response.first['attributes']).to include('product_name', 'category', 'url')
      #expect(json_api_response.first['relationships']).to include('invoice-items')

    end
  end

end


#   it "works! (now write some real specs)" do
#       get carts_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end
