class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index,:create]
  before_action :move_to_index, except: [:create]
  before_action :move_to_index2, except: [:create]

  def index
   @purchase_address = PurchaseAddress.new
  end
  def create
    @purchase_address =PurchaseAddress.new(purchase_address_params)
    if @purchase_address.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def purchase_address_params
    params.require(:purchase_address).permit(:post_code, :profecture_id, :municipalities, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:@item.price,
      card: purchase_address_params[:token],    
      currency: 'jpy'              
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def move_to_index2
    if @item.user_id != current_user.id && @item.purchase.present?
      redirect_to root_path
    end
  end
end