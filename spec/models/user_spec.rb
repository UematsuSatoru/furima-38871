require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '新規登録できるとき' do
       it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_kanaとfirst_kana、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
       end
   end
   context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが英字と数字の両方を含めるていないと登録できない' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaaaa11'
        @user.password_confirmation = 'aaaaa22'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
    it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameが全角ひらがな、全角カタカナ、漢字でなければ登録できない'do
        @user.last_name = 'YAMADA'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
    end
    it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameが全角ひらがな、全角カタカナ、漢字でなければ登録できない'do
        @user.first_name = 'YAMADA'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
    end
    it 'last_kanaが空では登録できない' do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
    end
    it 'last_kanaが全角カタカナでなければ登録できない'do
         @user.last_kana = '山田'
         @user.valid?
         expect(@user.errors.full_messages).to include("Last kana is invalid. Input full-width katakana characters")
    end
    it 'first_kanaが空では登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
    end
    it 'first_kanaが全角カタカナでなければ登録できない'do
        @user.first_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana is invalid. Input full-width katakana characters")
    end
    it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
   end
  end 
end

