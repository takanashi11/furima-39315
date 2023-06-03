class OrdersController < ApplicationController
  def index
   @purchase_address = PurchaseAddress.new
   @item = Item.find(params[:item_id])
  end
  def create
    @purchase_address =PurchaseAddress.new(purchase_address_params)
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_023d98576fc237ad113026d1" 
    Payjp::Charge.create(
      amount:@item.price,
      card: purchase_address_params[:token],    
      currency: 'jpy'              
    )
  end
end