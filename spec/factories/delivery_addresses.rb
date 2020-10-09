FactoryBot.define do
  factory :delivery_address do
   order_id                {9}
   postal_code             {"111-1111"}
   prefecture_id           {2}
   city                    {"ああああ"}  
   detail_address          {"いいいい"}
   building_name           {"うううう"}
   phone_number            {"12312341234"}
   association             :order
  end
end
