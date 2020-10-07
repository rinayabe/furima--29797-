require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品がうまくいくとき' do
      it 'imageがあれば登録できること' do
        expect(@item).to be_valid
      end

      it 'nameがあれば登録できること' do
        @item.name = 'aaa'
        expect(@item).to be_valid
      end

      it 'explainがあれば登録できること' do
        @item.explain = 'あいう'
        expect(@item).to be_valid
      end

      it 'category_idがあれば登録できること' do
        @item.category_id = '1'
        expect(@item).to be_valid
      end

      it 'condition_idがあれば登録できること' do
        @item.condition_id = '2'
        expect(@item).to be_valid
      end

      it 'fee_idがあれば登録できること' do
        @item.fee_id = '2'
        expect(@item).to be_valid
      end

      it 'area_idがあれば登録できること' do
        @item.area_id = '6'
        expect(@item).to be_valid
      end

      it 'days_idがあれば登録できること' do
        @item.days_id = '2'
        expect(@item).to be_valid
      end

      it 'nameがあれば登録できること' do
        @item.name = 'aaa'
        expect(@item).to be_valid
      end

      it 'priceがあれば登録できること' do
        @item.price = '555'
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'imageが空なら登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空なら登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'explainが空なら登録できない' do
        @item.explain = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end

      it 'category_idが空なら登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_idが空なら登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'fee_idが空なら登録できない' do
        @item.fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end

      it 'area_idが空なら登録できない' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it 'days_idが空なら登録できない' do
        @item.days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end

      it 'nameが空なら登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'priceが空なら登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが299円以下であれば登録できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが10,000,000円以下であれば登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
