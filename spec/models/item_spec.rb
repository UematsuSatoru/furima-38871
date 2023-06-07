require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@item).to be_valid
       end
    end

    context '商品出品できないとき' do
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーの情報が未選択では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態についての情報が未選択では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担についての情報が未選択では出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it '発送元の地域についての情報が未選択では出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it '発送までの日数についての情報が未選択では出品できない' do
        @item.number_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Number can't be blank")
      end

      it '価格についての情報が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300未満の場合は出品できない' do
        @item.price = 299 
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it '価格が9_999_999超えの場合は出品できない' do
        @item.price = 10000000 
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range') 
      end

      it '価格が半角数値以外の場合は出品できない' do
        @item.price = '５００' 
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range') 
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

    end 

  end 

end 
 
