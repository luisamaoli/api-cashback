require 'rails_helper'

RSpec.describe Balance, type: :model do
  describe 'Validates customer object and relationships' do
    let(:balance) { FactoryBot.create(:balance) }

    it 'has a product' do
      expect(balance).to be_valid
    end

    it 'belongs_to a customer' do
      expect(balance.customer).to be_kind_of(Customer)
    end

    it 'is related and has access to company' do
      expect(balance.customer.company.first).to be_kind_of(Company)
    end
  end
end
