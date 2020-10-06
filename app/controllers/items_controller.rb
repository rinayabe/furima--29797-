class ItemsController < ApplicationController

  def index 
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to action: :index
  else
    render action: :new
  end
end


  private

  def item_params
    params.require(:item).permit(:name, :image, :explain, :category_id, :condition_id, :fee_id, :area_id, :days_id, :price, :user).merge(user_id: current_user.id)
  end
end
