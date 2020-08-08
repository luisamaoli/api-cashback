FactoryBot.define do
  factory :customer do
    customer_name { "MyString" }
    numbers_of_ticket { 1 }
  end

  trait :with_company do
    after(:build) do |customer|
      create_list(:assignment, 3, customer: customer)
    end
  end
end
