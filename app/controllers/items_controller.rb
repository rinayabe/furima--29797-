class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_show, only: [:destroy]
  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render action: :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to action: :index
    else
      render action: :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explain, :category_id, :condition_id, :fee_id, :area_id, :days_id, :price, :user).merge(user_id: current_user.id)
  end
end

def move_to_index
  redirect_to action: :index unless user_signed_in?
end

def set_item
  @item = Item.find(params[:id])
end

def move_to_show
  redirect_to action: :show unless user_signed_in? && current_user.id == @item.user_id
end
