class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update]


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
    end

    def edit
      unless current_user == @item.user
        redirect_to action: :index
      end
    end

    def update
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

  def set_item
    @item = Item.find(params[:id])
  end

end
