require 'rails_helper'

RSpec.describe Api::V1::BalancesController, type: :controller do
    let!(:balance) { FactoryBot.create_list(:balance, 4) }

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
