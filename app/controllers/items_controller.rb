class ItemsController < ApplicationController
 # before_action :move_to_index, except: [:index, :show]

  def index
    #@item = Item.all
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
  
  private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_text, :category_id, :detail_id, :prefecture_id, :redion_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
  #def move_to_index
    #unless user_signed_in?
      #redirect_to action: :index
   # end
 # end
end
