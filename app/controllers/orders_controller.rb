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
    Payjp.api_key = "sk_test_0508289f3343ad47a8af88c8"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: sends_records_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
   
  
end