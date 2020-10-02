class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_purchase = UserPurchase.new
  end

  def new
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(purchase_params)
    @item = Item.find(params[:item_id])
    # binding.pry
    if @user_purchase.valid?
      pay_item
      @user_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:user_purchase).permit(:postcode, :area_id, :city, :road, :building, :phone).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
