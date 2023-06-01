class ItemsController < ApplicationController
  before_action :set_item, only:[:show,:edit,:update]
  before_action :move_to_index, except: [:index, :show]


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

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_text, :category_id, :detail_id, :profecture_id, :region_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
      return
    end
    if @item.nil? || @item.user.nil? || current_user.id != @item.user.id
      redirect_to root_path
     end
    
  end
end
