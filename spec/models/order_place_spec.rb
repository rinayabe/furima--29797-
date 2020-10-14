require 'rails_helper'

RSpec.describe OrderPlace, type: :model do
  describe '#create' do
    before do
      @order_place = FactoryBot.build(:order_place)
    end

    context '購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_place).to be_valid
      end

      it 'tokenが存在すれば保存できること' do
        @order_place.token = '1111'
        expect(@order_place).to be_valid
      end

      it '郵便番号が存在すれば保存できること' do
        @order_place.post_code = '123-4567'
        expect(@order_place).to be_valid
      end

      it '都道府県が存在すれば保存できること' do
        @order_place.area_id = '1'
        expect(@order_place).to be_valid
      end

      it '市区町村が存在すれば保存できること' do
        @order_place.city = 'あああ'
        expect(@order_place).to be_valid
      end

      it '番地が存在すれば保存できること' do
        @order_place.address = '123'
        expect(@order_place).to be_valid
      end

      it '電話番号が存在すれば保存できること' do
        @order_place.phone_number = '11111111111'
        expect(@order_place).to be_valid
      end

      it '電話番号が11桁以内であれば保存できること' do
        @order_place.phone_number = '11111111'
        expect(@order_place).to be_valid
      end

      it '電話番号が数字だけであれば保存できること' do
        @order_place.phone_number = '11111111111'
        expect(@order_place).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'tokenが空ならば保存できないこと' do
        @order_place.token = nil
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空ならば保存できないこと' do
        @order_place.post_code = nil
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号にハイフンがなければ保存できないこと' do
        @order_place.post_code = '1112222'
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include('Post code is invalid')
      end

      it '都道府県が空ならば保存できないこと' do
        @order_place.area_id = nil
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include("Area can't be blank")
      end

      it '市区町村が空ならば保存できないこと' do
        @order_place.city = nil
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空ならば保存できないこと' do
        @order_place.address = nil
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空ならば保存できないこと' do
        @order_place.phone_number = nil
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が12桁以上であれば保存できないこと' do
        @order_place.phone_number = '123456789123'
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号に数字以外が含まれれば保存できないこと' do
        @order_place.phone_number = '123-45678-9123'
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
