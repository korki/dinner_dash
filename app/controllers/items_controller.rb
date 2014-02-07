class ItemsController < ApplicationController

  include ItemsHelper

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    # render text: 'ddd'
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    
    if @item.errors.blank?
      redirect_to item_path(@item), flash: {error: "Item '#{@item.name}' Saved!" }
    else
      redirect_to new_item_path(@item), flash: { error: "Item was invalid!" }
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    flash.notice = "Item '#{@item.name}' Updated!"
    redirect_to item_path(@item)
  end  

  def destroy
    @item = Item.find(params[:id])
    flash.notice = "Item '#{@item.name}' Deleted!"
    @item.destroy
    redirect_to items_path
  end

  def browse_by_cat
    @items = Item.where("category_id = ?", params[:category_id])
    render 'items/index.html.erb'
  end

end
