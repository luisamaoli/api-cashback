require 'rails_helper'

RSpec.describe Assignment, type: :model do
  it 'validates assignment' do
    assignment = FactoryBot.build(:assignment)
    expect(assignment.company).to be_kind_of(Company)
    expect(assignment.customer).to be_kind_of(Customer)
  end
end
