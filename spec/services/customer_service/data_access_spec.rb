require 'rails_helper'

RSpec.describe CustomerService::DataAccess do
    let(:customer) { FactoryBot.create(:customer, :with_company) }
    let(:company) { FactoryBot.create(:company, :with_customer) }

    context 'Find in data base' do  
        it 'returns customer through id' do
            expect(described_class.find_through_id(customer.id)).to eq(customer)
        end

        it 'lists companuies from an customer' do
            expect(described_class.list_from_company(company)).to eq(company.customer)
        end
    end
end