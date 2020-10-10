FactoryBot.define do
    factory :user do
      nickname              {Faker::Japanese::Name.last_name}
      email                 {Faker::Internet.free_email}
      password              {"aaa1111"}
      password_confirmation { password }
      family_name_kanji     {Faker::Japanese::Name.last_name}
      first_name_kanji      {Faker::Japanese::Name.first_name}
      family_name_kana      {Gimei.last.katakana}
      first_name_kana       {Gimei.first.katakana}
      birthday              {Faker::Date.birthday}
    end
  end