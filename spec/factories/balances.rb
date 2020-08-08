FactoryBot.define do
  factory :balance do
    cashback_balance { 1.5 }
    customer_id {02}

    customer { create(:customer, :with_company) }
  end
end
