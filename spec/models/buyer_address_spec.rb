require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
    end

    describe '商品購入機能' do
      context '商品購入できるとき' do
        
        it 'クレジットカード情報と配送先が記載されていれば購入できる' do
        expect(@buyer_address).to be_valid
        end

        it 'building_nameは空でも保存できること' do
          @buyer_address.building_name = nil
          expect(@buyer_address).to be_valid
        end
      
      end

      context '商品購入できないとき' do

        it 'クレジットカード情報が空では登録できないこと' do
          @buyer_address.token = nil
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
        end

        it 'postal_codeが空だと保存できないこと' do
          @buyer_address.postal_code = nil
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
        end

        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @buyer_address.postal_code = "1800002"
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Postal code is invalid")
        end

        it 'shipping_address_idを選択していないと保存できないこと' do
          @buyer_address.shipping_address_id = ""
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Shipping address can't be blank", "Shipping address is not a number")
        end

        it 'shipping_address_idが0以外でない保存できないこと' do
          @buyer_address.shipping_address_id = 0
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Shipping address must be other than 0")
        end

        it 'municipalitiesが空では保存できないこと' do
          @buyer_address.municipalities = nil
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Municipalities can't be blank")
        end

        it 'addressが空では保存できないこと' do
          @buyer_address.address = nil
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
        end

        it 'phone_numberが空だと保存できないこと' do
          @buyer_address.phone_number = nil
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
        end

        it 'phone_numberが数字のみで無いと保存できないこと' do
          @buyer_address.phone_number = "aaaaaaaaaa"
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
        end

        it 'phone_numberが12桁以上では登録できないこと' do
          @buyer_address.phone_number = "111111111111"
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
        end

        it 'user_idが空だと登録できない' do
          @buyer_address.user_id = nil
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("User can't be blank")
        end

        it 'item_idが空だと登録できない' do
          @buyer_address.item_id = nil
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
        end

      end
    end
end
