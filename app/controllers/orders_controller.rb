class OrdersController < ApplicationController
  def index
   @purchase_address = PurchaseAddress.new
   @item = Item.find(params[:item_id])
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end
  def create
    @purchase_address =PurchaseAddress.new(purchase_address_params)
    @item = Item.find(params[:item_id])
    if @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:post_code, :profecture_id, :municipalities, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end