class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path(@item)
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :condition_id, :category_id, :prefecture_id, :shipping_fee_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end

end
