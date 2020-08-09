require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do
    let!(:customer) { FactoryBot.create_list(:customer, 4) }
    let!(:id) {1}

    it 'returns 200' do
        get :index
        expect(response).to have_http_status(200)
    end

    it 'shows all balances' do
        get :index
        parsed_response = JSON.parse(response.body)
        expect(parsed_response.count).to eq(4)
    end
end
