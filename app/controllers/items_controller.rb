class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:update,:destroy]
  before_action :set_item, only:[:show,:edit,:update,:destroy]
  before_action :move_to_index, except: [:index, :show,:new,:create]
 

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
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
    redirect_to item_path
    else 
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_text, :category_id, :detail_id, :profecture_id, :region_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id != @item.user.id ||@item.purchase.present?
      redirect_to root_path
     end
  end
end

