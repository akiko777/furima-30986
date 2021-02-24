class CustomersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_customer, only: [:index, :create]

  def index
    @customer_destination = CustomerDestination.new
    if current_user == @item.user or @item.customer.present?
       redirect_to root_path
    end
  end


  def create
    @customer_destination = CustomerDestination.new(customer_destination_params)
    if @customer_destination.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: customer_destination_params[:token],
        currency: 'jpy'
      )
       @customer_destination.save
       redirect_to root_path(@customer_destination)
    else
      render action: :index
    end
  end

private

  def customer_destination_params
    params.require(:customer_destination).permit(:post_code, :prefecture_id, :city, :address, :buillding_name, :phone_number).
       merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_customer
    @item = Item.find(params[:item_id])
  end

end
