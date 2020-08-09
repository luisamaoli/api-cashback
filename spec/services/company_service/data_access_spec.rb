require 'rails_helper'

RSpec.describe CompanyService::DataAccess do
    let(:customer) { FactoryBot.create(:customer, :with_company) }
    let(:company) { FactoryBot.create(:company, :with_customer) }

    context 'Find in data base' do        
        it 'returns customer through id' do
            expect(described_class.find_through_id(company.id)).to eq(company)
        end

        it 'lists companuies from an customer' do
            expect(described_class.list_from_customer(customer)).to eq(customer.company)
        end
    end
end