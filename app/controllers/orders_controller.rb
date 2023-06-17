class OrdersController < ApplicationController
  def index
    @sends_records_form = SendsRecordsForm.new
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
    params.require(:sends_records_form).permit(:post_code, :area_id, :city, :address, :tel, :building, :user_id, :item_id)
  end
end