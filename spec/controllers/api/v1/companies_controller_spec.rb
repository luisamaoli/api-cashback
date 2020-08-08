require 'rails_helper'

RSpec.describe Api::V1::CompaniesController, type: :controller do
    let!(:company) { FactoryBot.create_list(:company, 4) }

    it 'returns 200' do
        get :index
        expect(response).to have_http_status(200)
    end

    it 'shows all accounts' do
        get :index
        parsed_response = JSON.parse(response.body)
        expect(parsed_response.count).to eq(4)
    end
end
