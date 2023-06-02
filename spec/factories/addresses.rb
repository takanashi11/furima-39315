FactoryBot.define do
  factory :address do

 association :user
 association :item
 association :purchase
  end
end
