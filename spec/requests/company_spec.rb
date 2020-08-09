require 'rails_helper'

RSpec.describe 'Companies', type: :request do

    describe 'GET /companies' do
        before do
          FactoryBot.create_list(:company, 5, :with_customer)
          get '/api/v1/companies'
        end
    
        it 'responds with a 200 status' do
          expect(response).to have_http_status(200)
        end
    end

    describe 'GET /companies/:id' do
        let(:given_id) { 100 }
        before { get '/api/v1/companies/:company_id' }
    
        context 'when company does not exist' do
            it 'responds with a 404 status' do
                get "/api/v1/companies/#{given_id}"
                expect(response).to have_http_status(404)
            end
    
            it 'returns a not found message' do
                get "/api/v1/companies/#{given_id}"
                expect(response.body).to eq('Company is not in the Database')
          end
        end
    
        context 'when customer exists' do
            let(:company) { FactoryBot.create(:company, :with_customer) }
            it 'returns companys of companies' do
                get "/api/v1/companies/#{company.id}"
                expect(response.body).to include_json(
                                                        company_id: (be_kind_of Integer),
                                                        company_name: (be_kind_of String),
                                                        company_ticket_value: (be_kind_of Integer),
                                                        company_cashback_value: (be_kind_of Float),
                                                        customers_purchases: (be_kind_of Array),
                                                  )
            end
        end
    end
end