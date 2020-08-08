FactoryBot.define do
  factory :company do
    company_name { "MyString" }
    ticket_value { 1 }
    cashback_value { 1.5 }
  end

  trait :with_customer do
    after(:build) do |company|
      create_list(:assignment, 3, company: company)
    end
  end
end
