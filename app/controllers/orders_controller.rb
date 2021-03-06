class OrdersController < ApplicationController
  before_action :move_to_root_path, only: [:index]
  before_action :item, only: [:index, :create]
  before_action :authenticate_user!
  
  def index
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
    @order = Order.new
  end

  def create
    @order = OrderPlace.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root_path
    @item = Item.find(params[:item_id])
    redirect_to root_path unless @item.order.nil?
  end

  def item
    @item = Item.find(params[:item_id])
  end

end
