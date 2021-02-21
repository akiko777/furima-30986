class CustomersController < ApplicationController

  def index
    @customer_destination = CustomerDestination.new
  end


  def create
    @customer_destination = CustomerDestination.new(customer_destination_params)
    if @customer_destination.valid?
       @customer_destination.save
       redirect_to root_path(@customer_destination)
    else
      render action: :index
    end
  end

private

def customer_destination_params
  params.require(:customer_destination).permit(:post_code, :prefecture_id, :city, :address, :buillding_name, :phone_number, :customer_id,).
     merge(user_id: current_user.id, item_id: params[:item_id])
end

end
