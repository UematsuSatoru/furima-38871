class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update]
  before_action :configure_permitted_parameters, if: :devise_controller? 
  

  def index
    @items = Item.all.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:image,:name,:explanation,:category_id,:condition_id,:area_id,:delivery_charge_id,:number_id,:price,)
    .merge(user_id: current_user.id)
  end

  def correct_user
    @item = Item.find(params[:id])
    redirect_to root_path unless @item.user_id == current_user.id
  end
end
