require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品がうまくいくとき' do
      it '全ての値が正しく保存されているとき' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'nameが空だと保存できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'imageが空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'textが空だと登録できないこと' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'categoryが空だと登録できないこと' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'statusが空だと保存できないこと' do
        @item.status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end

      it 'delivery_feeが空だと登録できないこと' do
        @item.delivery_fee_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee Select')
      end

      it 'areaが空だと保存できないこと' do
        @item.area_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Area Select')
      end

      it 'dayが空だと保存できないこと' do
        @item.day_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Day Select')
      end

      it 'priceが空だと保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが半角数字以外だと保存できないこと' do
        @item.price = 'aaああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceが300~9999999以外だと保存できないこと' do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceが300~9999999以外だと保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
