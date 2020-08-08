require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { FactoryBot.create(:customer, :with_company)}
  it 'validates customer' do
    expect(customer).to be_valid
  end
  it 'has_many companies' do
    expect(customer.assignment.count).to eq(3)
  end
  it 'accesses company table directly' do    
    expect(customer.company.first).to be_valid
  end
end
