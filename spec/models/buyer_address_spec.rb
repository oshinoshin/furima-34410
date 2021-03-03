require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
    before do
      @buyer_address = FactoryBot.build(:buyer_address)
    end

    describe '商品購入機能' do
      context '商品購入できるとき' do
        
        it '全て記載されていれば購入できる' do
        expect(@buyer_address).to be_valid
        end
      
      end

      context '商品購入できないとき' do

        it 'postal_codeが空だと保存できないこと' do
          @buyer_address.postal_code = nil
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
        end

        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @buyer_address.postal_code = 1800002
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Postal code is invalid")
        end

        it 'shipping_address_idを選択していないと保存できないこと' do
          @buyer_address.shipping_address_id = ""
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Shipping address can't be blank", "Shipping address is not a number")
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

        it 'building_nameは空でも保存できること' do
          @buyer_address.building_name = nil
          expect(@buyer_address).to be_valid
        end
        it 'phone_numberが空だと保存できないこと' do
          @buyer_address.phone_number = nil
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
        end
      end
    end
end
