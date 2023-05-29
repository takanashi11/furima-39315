require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
end

describe 'ユーザー新規登録' do
  context '新規登録できる場合' do
    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
      expect(@user).to be_valid
    end
  end
  context '新規登録できない場合' do
    it "nameが空では登録できない" do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end


    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

   it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it '名前(全角)が名字と名前の両方が必須であること' do
      @user.surname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname can't be blank")
      
      @user.surname = '山田'
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it '名前(全角)は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.surname = 'Yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname is invalid")
      
      @user.surname = '山田'
      @user.name = 'Tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name is invalid")
    end
    it '名前カナ(全角)が名字と名前の両方が必須であること' do
      @user.katakana_surname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana surname can't be blank")
      
      @user.katakana_surname = 'ヤマダ'
      @user.katakana_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana name can't be blank")
    end
    
    it '名前カナ(全角)は全角（カタカナ）での入力が必須であること' do
      @user.katakana_surname = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana surname is invalid")
      
      @user.katakana_surname = 'ヤマダ'
      @user.katakana_name = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana name is invalid")
    end


    it '生年月日が必須であること' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end
end