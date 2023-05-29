FactoryBot.define do
  factory :user do
    nickname {'test'}
    email {Faker::Internet.free_email}
    password {'aaa111'}
    password_confirmation {password}
    surname {'山田'}
    name {'太郎'}
    katakana_surname {'ヤマダ'}
    katakana_name {'タロウ'}
    birth {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end