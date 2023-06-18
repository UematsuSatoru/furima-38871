class OrdersController < ApplicationController
  def index
    @sends_records_form = SendsRecordsForm.new
    @item = Item.find(params[:item_id]) 
  end

  def create
    @sends_records_form = SendsRecordsForm.new(order_params)
    if @sends_records_form.valid?
      @sends_records_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:sends_records_form).permit(:image,:price,:name, :post_code, :area_id, :city, :address, :tel, :building).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token]) 
  end
end