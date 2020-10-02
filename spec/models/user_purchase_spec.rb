require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '商品購入' do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    context '新規登録がうまくいくとき' do
      it '全ての値が正しく保存されているとき' do
        expect(@user_purchase).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'tokenが空だと保存できないこと' do
        @user_purchase.token = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      end

      it 'postcodeが空だと保存できないこと' do
        @user_purchase.postcode = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'postcodeが(-)なしだと保存できないこと' do
        @user_purchase.postcode = 1_234_567
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end

      it 'areaが空だと保存できないこと' do
        @user_purchase.area_id = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Area Select')
      end

      it 'cityが空だと保存できないこと' do
        @user_purchase.city = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end

      it 'roadが空だと保存できないこと' do
        @user_purchase.road = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Road can't be blank")
      end

      it 'phoneが空だと保存できないこと' do
        @user_purchase.phone = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneが半角数字以外だと保存できないこと' do
        @user_purchase.phone = '1234asdfdd'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Phone number is invalid. Include half-width numbers')
      end
    end
  end
end
