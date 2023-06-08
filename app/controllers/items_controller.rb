class ItemsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:explanation,:category_id,:condition_id,:area_id,:delivery_charge_id,:number_id,:price,)
    .merge(user_id: current_user.id)
  end

end
