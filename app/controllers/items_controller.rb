class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]


    def index
      @items = Item.includes(:user).order("created_at DESC")
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

    def show
      @item = Item.find(params[:id])
    end

    def edit
      @item = Item.find(params[:id])
      unless current_user == @item.user
        redirect_to action: :index
      end
    end

    def update
        @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to action: :show
      else
        render :edit
      end
    end

    #def destroy
    #end



  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :condition_id, :category_id, :prefecture_id, :shipping_fee_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end

end
