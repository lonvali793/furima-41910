class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set, only: [:index, :create]

  def index
    
    if current_user.id == @item.user_id || @item.order.present? 
      redirect_to root_path     
    end
  gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  @order_address = OrderAddress.new
  end


  def create
   
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path

    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
     render :index, status: :unprocessable_entity
  end
 end

private

def set
  @item = Item.find(params[:item_id])
end

def order_address_params
params.require(:order_address).permit(
  :postal_code, :prefecture_id, :city, :house_number,
  :building_name,:phone_number
).merge(user_id: current_user.id, item_id: @item.id,token: params[:token])
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,
    card: order_address_params[:token],
    currency: 'jpy'
  )
end

end