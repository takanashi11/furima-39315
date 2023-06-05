require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address,user_id: @user.id, item_id: @item.id)
    end
  
    describe '配送先の住所情報' do
      context '正常に保存されること' do
        it '全ての情報が正しく入力されていれば正常に保存されること' do
          expect(@purchase_address).to be_valid
        end
      end
    
      context '正常に保存できない場合' do
        it '郵便番号が必須であること' do
          @purchase_address.post_code = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
        end
  
        it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能であること' do
          @purchase_address.post_code = '1234567'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end
  
        it '都道府県が必須であること' do
          @purchase_address.profecture_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Profecture can't be blank")
        end
  
        it '市区町村が必須であること' do
          @purchase_address.municipalities = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
        end
  
        it '番地が必須であること' do
          @purchase_address.house_number = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
        end
  
        it '建物名は任意であること' do
          @purchase_address.building_name = nil
          expect(@purchase_address).to be_valid
        end
  
        it '電話番号が必須であること' do
          @purchase_address.telephone_number = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
        end

        it '9桁以下の電話番号では購入できない' do
          @purchase_address.telephone_number = '123456789'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Telephone number should be a 10 to 11-digit numeric value")
        end
        
        it '12桁以上の電話番号では購入できない' do
          @purchase_address.telephone_number = '123456789012' 
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Telephone number should be a 10 to 11-digit numeric value")
        end
  
        it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能であること' do
          @purchase_address.telephone_number = '090-1234-5678'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Telephone number should be a 10 to 11-digit numeric value")
        end

        it 'トークンが必須であること' do
          @purchase_address.token = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
        end

        it 'userが紐付いていないと保存できない' do
          @purchase_address.user_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("User can't be blank")
        end
        it 'itemが紐付いていないと保存できない' do
          @purchase_address.item_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
        end
      end 
    end
  end
