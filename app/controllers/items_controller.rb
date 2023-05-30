class ItemsController < ApplicationController
  def index
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(article_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:item).permit(:name,:explanation,:category_id,:condition_id,:area_id,:delivery_charge_id,:number_id,:price)
  end

end
