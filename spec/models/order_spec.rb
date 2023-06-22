require 'rails_helper'

RSpec.describe SendsRecordsForm, type: :model do
  before do
    user = FactoryBot.create(:user) 
    item = FactoryBot.create(:item, user_id: user.id) 
    @sends_records_form = FactoryBot.build(:sends_records_form, user_id: user.id, item_id: item.id)
  end
  


  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@sends_records_form).to be_valid
      end
      
      it '建物名が空でも購入できる' do
        @sends_records_form.building = nil
        expect(@sends_records_form).to be_valid
      end

    end
  
    end
  
    context '商品出品できないとき' do

      it '郵便番号が空では購入できない' do
        @sends_records_form.post_code = nil
        @sends_records_form.valid?
        expect(@sends_records_form.errors.full_messages).to include("Post code can't be blank")
      end
  
      it 'area_idが空だと保存できないこと' do
        @sends_records_form.area_id = nil
        @sends_records_form.valid?
        expect(@sends_records_form.errors.full_messages).to include("Area can't be blank")
      end
  
      it 'area_idが1だと保存できないこと' do
        @sends_records_form.area_id = 1 
        @sends_records_form.valid?
        expect(@sends_records_form.errors.full_messages).to include("Area can't be blank")
      end
  
      it 'cityが空だと保存できないこと' do
        @sends_records_form.city = nil
        @sends_records_form.valid?
        expect(@sends_records_form.errors.full_messages).to include("City can't be blank")
      end
  
      it 'addressが空だと保存できないこと' do
        @sends_records_form.address = nil
        @sends_records_form.valid?
        expect(@sends_records_form.errors.full_messages).to include("Address can't be blank")
      end
  
      it 'telが空だと保存できないこと' do
        @sends_records_form.tel = nil
        @sends_records_form.valid?
        expect(@sends_records_form.errors.full_messages).to include("Tel can't be blank")
      end
  
      it 'telが9桁以下だと保存できないこと' do
        @sends_records_form.tel = "123456789" 
        @sends_records_form.valid?
        expect(@sends_records_form.errors.full_messages).to include("Tel is invalid")
      end
  
      it 'telが12桁以上だと保存できないこと' do
        @sends_records_form.tel = "123456789012" 
        @sends_records_form.valid?
        expect(@sends_records_form.errors.full_messages).to include("Tel is invalid")
      end
  
      it 'telに半角数字以外が含まれていると保存できないこと' do
        @sends_records_form.tel = "123-4567-8901" 
        @sends_records_form.valid?
        expect(@sends_records_form.errors.full_messages).to include("Tel is invalid")
      end
  
      it 'tokenが空だと保存できないこと' do
        @sends_records_form.token = nil
        @sends_records_form.valid?
        expect(@sends_records_form.errors.full_messages).to include("Token can't be blank")
      end
  
      it 'userが紐付いていなければ保存できないこと' do
        @sends_records_form.user_id = nil 
        @sends_records_form.valid?
        expect(@sends_records_form.errors.full_messages).to include("User can't be blank")
      end
  
      it 'itemが紐付いていなければ保存できないこと' do
        @sends_records_form.item_id = nil 
        @sends_records_form.valid?
        expect(@sends_records_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end

