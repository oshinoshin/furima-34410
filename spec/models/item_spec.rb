require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do

      it 'imageとnameとdescriptionとcategory_idとitem_status_idとshipping_fee_idとshipping_address_idとshipping_date_idとpriceが存在すれば登録できる'do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
    
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
    
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
    
      it 'item_status_idが空では登録できない' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank", "Item status is not a number")
      end

      it 'shipping_fee_idが空では登録できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank", "Shipping fee is not a number")
      end
    
      it 'shipping_address_idが空では登録できない' do
        @item.shipping_address_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping address can't be blank", "Shipping address is not a number")
      end
    
      it 'shipping_date_idが空では登録できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank", "Shipping date is not a number")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    
    
    end
  end
end
