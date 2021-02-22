class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end
  
  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :item_status_id, :shipping_fee_id, :shipping_address_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
