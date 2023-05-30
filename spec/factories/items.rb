FactoryBot.define do
  factory :item do
    item_name        {'アイテムネーム'}    
    item_text        {'アイテムテキスト'}
    category_id      {'2'}
    detail_id        {'2'}
    profecture_id    {'2'}
    region_id        {'2'}
    days_to_ship_id  {'2'}
    price            {'1000'}

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end 
  end
end
