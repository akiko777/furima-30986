class ItemsController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :condition_id, :category_id, :prefecture_id, :shipping_fee_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end

end
