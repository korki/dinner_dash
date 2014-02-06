class CategoriesController < ApplicationController
include CategoriesHelper

  def categories
    @categories = Category.all
  end

  def new
    @category = Category.new  
  end

  def create
    @category = Category.create(category_params)
    #@category.save
    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

   def update
    @category = Category.find(params[:id])
    @category.update(category_params)

    flash.notice = "Category '#{@category.name}' Updated!"
    redirect_to categories_path(@category)
  end  

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

end