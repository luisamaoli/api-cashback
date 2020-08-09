require 'rails_helper'

RSpec.describe 'Customers', type: :request do

    describe 'GET /customers' do
        before do
          FactoryBot.create_list(:customer, 5, :with_company)
          get '/api/v1/customers'
        end
    
        it 'responds with a 200 status' do
          expect(response).to have_http_status(200)
        end
    end

    describe 'GET /customers/:id' do
        let(:given_id) { 100 }
        before { get '/api/v1/customers/:customer_id' }
    
        context 'when pool does not exist' do
            it 'responds with a 404 status' do
                get "/api/v1/customers/#{given_id}"
                expect(response).to have_http_status(404)
            end
    
            it 'returns a not found message' do
                get "/api/v1/customers/#{given_id}"
                expect(response.body).to eq('Custumer is not in the Database')
          end
        end
    
        context 'when customer exists' do
            let(:customer) { FactoryBot.create(:customer, :with_company) }
            it 'returns companys of customers' do
                get "/api/v1/customers/#{customer.id}"
                expect(response.body).to include_json(
                                                    customer_id: (be_kind_of Integer),
                                                    customer_name: (be_kind_of String),
                                                    customer_numbers_of_tickes_each: (be_kind_of Integer),
                                                    company_purchases: (be_kind_of Array)
                                                  )
            end
        end
    end


    describe 'POST /customers/:id/buyticket' do
        let(:buy_customer) { CustomerService::Operations }
        let(:customer) { FactoryBot.create(:customer, :with_company) }
    
        context 'Success' do

            before { allow(buy_customer).to receive(:buy) }
    
            it 'responds with a 200 status' do
            post "/api/v1/customers/#{customer.id}/buyticket"
            expect(response.status).to eq(200)
            end
    
            it 'calls service' do
            post "/api/v1/customers/#{customer.id}/buyticket"
            expect(buy_customer).to have_received(:buy)
            end
        end

        context 'When customer does not exist' do
            it 'responds with a 404 status' do
                post "/api/v1/customers/#{customer.id}/buyticket"
                expect(response).to have_http_status(404)
            end
    
            it 'returns a not found message' do
                post "/api/v1/customers/#{customer.id}/buyticket"
                expect(response.body).to eq('Custumer is not in the Database')
            end 
        end        
    end
    
    describe 'POST /customers/:id/buyticketwithcashback' do
        let(:buy_customer) { CustomerService::Operations }
        let(:customer) { FactoryBot.create(:customer, :with_company) }
    
        context 'Success' do

            before { allow(buy_customer).to receive(:buy_with_cashback) }
    
            it 'responds with a 200 status' do
            post "/api/v1/customers/#{customer.id}/buyticketwithcashback"
            expect(response.status).to eq(200)
            end
    
            it 'calls service' do
            post "/api/v1/customers/#{customer.id}/buyticketwithcashback"
            expect(buy_customer).to have_received(:buy_with_cashback)
            end
        end

        context 'When customer does not exist' do
            it 'responds with a 404 status' do
                post "/api/v1/customers/#{customer.id}/buyticketwithcashback"
                expect(response).to have_http_status(404)
            end
    
            it 'returns a not found message' do
                post "/api/v1/customers/#{customer.id}/buyticketwithcashback"
                expect(response.body).to eq('Custumer is not in the Database')
            end 
        end           
    end 
end