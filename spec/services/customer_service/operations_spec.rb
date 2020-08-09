require 'rails_helper'

RSpec.describe CustomerService::Operations do
    let(:customer) { FactoryBot.create(:customer, :with_company) }
    let(:company) { FactoryBot.create(:company, :with_customer) }
    let(:balance) { FactoryBot.create(:balance) }
    let(:customer_service) { class_double(CustomerService::DataAccess) }
    let(:company_service) { class_double(CompanyService::DataAccess) }
    let(:balance_service) { class_double(BalanceService::DataAccess) }
    let(:tickets_number) {3}

    context 'Buy tickets with creditcar' do
        before do
          customer_info = { customer_id: customer.id,
            customer_name: customer.customer_name,
            customer_numbers_of_tickes_each: customer.numbers_of_ticket,
            company_purchases: customer,
            total_cashback: balance,
            updated_at: customer.updated_at }
          allow(described_class).to receive(:buy).with(customer_service, customer.id, tickets_number, company_service, company.id, balance_service).and_return(customer_info)
        end
  
        it 'returns custumer info' do
          expect(described_class.buy(customer_service, customer.id, tickets_number, company_service, company.id, balance_service)).to include(
            {   customer_name: (be_kind_of String),
                customer_numbers_of_tickes_each: (be_kind_of Integer),
                company_purchases: (be_kind_of Customer),
                total_cashback: (be_kind_of Balance) })
        end
    end

    context 'Buy tickets with cashback' do
        before do
          customer_info = { status: "Successful or Insufficient balance",
            customer_id: customer.id,
            customer_name: customer.customer_name,
            customer_numbers_of_tickes_each: customer.numbers_of_ticket,
            company_purchases: customer,
            total_cashback: balance,
            updated_at: customer.updated_at }
          allow(described_class).to receive(:buy_with_cashback).with(customer_service, customer.id, tickets_number, company_service, company.id, balance_service).and_return(customer_info)
        end
  
        it 'returns custumer info' do
          expect(described_class.buy_with_cashback(customer_service, customer.id, tickets_number, company_service, company.id, balance_service)).to include(
            {   status: (be_kind_of String),
                customer_name: (be_kind_of String),
                customer_numbers_of_tickes_each: (be_kind_of Integer),
                company_purchases: (be_kind_of Customer),
                total_cashback: (be_kind_of Balance) })
        end
    end
end
