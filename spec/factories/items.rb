FactoryBot.define do
  factory :item do
    image                {}
    name                 {Faker::Name.name}
    description          {"G-Shockの時計です"}
    category_id          {2}  
    condition_id         {2}
    shipping_fee_id      {2}
    ship_from_address_id {2}
    shipping_days_id     {2}
    price                {1000}
    association          :user


  end
end
