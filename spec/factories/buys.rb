FactoryBot.define do
  factory :buy do
    postal_code             {"111-1111"}
    prefecture_id           {2}
    city                    {"ああああ"}  
    detail_address          {"いいいい"}
    building_name           {"うううう"}
    phone_number            {"12312341234"}
    token                   {"tok_abcdefghijk00000000000000000"}
  end
end
