require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) { FactoryBot.create(:company, :with_customer)}
  it 'validates company' do
    expect(company).to be_valid
  end
  it 'has_many companies' do
    expect(company.assignment.count).to eq(3)
  end
  it 'accesses customer table directly' do
    expect(company.customer.first).to be_valid
  end
end
