class OrdersController < ApplicationController
  def index
    @sends_records_form = SendsRecordsForm.new
    @item = Item.find(params[:item_id]) 
  end

  def new
    @sends_records_form = SendsRecordsForm.new
  end


  def create
    @sends_records_form = SendsRecordsForm.new(sends_records_params)
    if @sends_records_form.valid?
      @sends_records_form.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
  def sends_records_params
    params.require(:sends_records_form).permit(:post_code, :area_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end