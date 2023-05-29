class ItemsController < ApplicationController
 # before_action :move_to_index, except: [:index, :show]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :text)
  end
  #def move_to_index
    #unless user_signed_in?
      #redirect_to action: :index
   # end
 # end
end
