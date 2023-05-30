require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end


describe '商品出品機能' do
  context'正常に保存されること' do
  it '商品名、説明、カテゴリー、状態、配送料の負担、地域、日数、価格が存在すれば正常に保存されること' do
    expect(@item).to be_valid
  end
 end
  context'正常に保存できない場合' do
  it '商品名が必須であること' do
    @item.item_name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Item name can't be blank")
  end

  it '商品の説明が必須であること' do
    @item.item_text = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Item text can't be blank")
  end

  it 'カテゴリーの情報が必須であること' do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end

  it '商品の状態の情報が必須であること' do
    @item.detail_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Detail can't be blank")
  end

  it '配送料の負担の情報が必須であること' do
    @item.region_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Region can't be blank")
  end

  it '発送元の地域の情報が必須であること' do
    @item.profecture_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Profecture can't be blank")
  end

  it '発送までの日数の情報が必須であること' do
    @item.days_to_ship_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Days to ship can't be blank")
  end

  it '価格の情報が必須であること' do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it '価格は300円以上であること' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
  end

  it '価格は9,999,999円以下であること' do
    @item.price = 10_000_000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
  end
end
end