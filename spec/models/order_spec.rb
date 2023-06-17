require 'rails_helper'

RSpec.describe SendsRecordsForm, type: :model do
  before do
    @sends_records_form = FactoryBot.build(:sends_records_form)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@sends_records_form).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'post_codeが空だと保存できないこと' do
        @sends_records_form.post_code = nil
        @sends_records_form.valid?
        expect(@sends_records_form.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが「3桁ハイフン4桁」の半角文字列でないと保存できないこと' do
        @sends_records_form.post_code = '1234567'
        @sends_records_form.valid?
        expect(@sends_records_form.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'area_idが空だと保存できないこと' do
        @sends_records_form.area_id = nil
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

      it 'telが10桁以上11桁以内の半角数値でないと保存できないこと' do
        @sends_records_form.tel = '123456789011'
        @sends_records_form.valid?
        expect(@sends_records_form.errors.full_messages).to include('Tel is too long (maximum is 11 characters)')
      end
    end
  end
end
