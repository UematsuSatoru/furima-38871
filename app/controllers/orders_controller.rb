class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :move_to_index, only: [:index, :create]
 


  def index
    @sends_records_form = SendsRecordsForm.new
    @item = Item.find(params[:item_id]) 
  end

  def new
    @sends_records_form = SendsRecordsForm.new
  end


  def create
    @sends_records_form = SendsRecordsForm.new(sends_records_params)
    @item = Item.find(params[:item_id]) 
    if @sends_records_form.valid?
      pay_item

      @sends_records_form.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
  def sends_records_params
    params.require(:sends_records_form).permit(:post_code, :area_id, :city, :address, :building, :tel,).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: sends_records_params[:token],   
        currency: 'jpy'                 
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user == @item.user || @item.order.present?
      redirect_to root_path
    end
  end
   
end 
