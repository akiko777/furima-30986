class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :contributor_confirmation, only: [:edit, :update]

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
    end

    def update
      if @item.update(item_params)
        redirect_to root_path
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

  def contributor_confirmation
    unless current_user == @item.user
      redirect_to action: :index
    end
  end

end


