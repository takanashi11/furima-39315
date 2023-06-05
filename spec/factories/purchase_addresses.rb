FactoryBot.define do
  factory :purchase_address do
     post_code         {'123-4567'} 
     profecture_id     {'2'} 
     municipalities    {'横浜市緑区'} 
     house_number      {'青山1-1-1'} 
     building_name     {'柳ビル103'} 
     telephone_number  {'09012345678'} 
     token             {'tok_abcdefghijk00000000000000000'}
     
     association :user
     association :item
  end
end
