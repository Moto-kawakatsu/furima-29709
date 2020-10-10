FactoryBot.define do
  factory :order do
    association :delivery_address
    association :user
    association :item
  end
  end
