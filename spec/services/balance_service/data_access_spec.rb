require 'rails_helper'

RSpec.describe BalanceService::DataAccess do
    let(:balance) { FactoryBot.create(:balance) }

    context 'Find in data base' do
        it 'returns balance through customer_id' do
            expect(described_class.find_through_customer(balance.customer_id)).to eq(balance)
        end

        it 'returns pool through pool_name' do
            expect(described_class.find_cashback(balance)).to eq(balance.cashback_balance)
        end
    end
end