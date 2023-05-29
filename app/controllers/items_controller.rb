class ItemsController < ApplicationController
  def index
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
end
