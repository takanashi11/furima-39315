FactoryBot.define do
  factory :purchase do
    association :user
    association :item
    association :address
  end
end
