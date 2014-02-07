module Admin
  class CategoriesController < ApplicationController
  include CategoriesHelper

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new  
    end

    def create
      @category = Category.create(category_params)
      #@category.save
      redirect_to admin_categories_path
    end

    def edit
      @category = Category.find(params[:id])
    end

     def update
      @category = Category.find(params[:id])
      @category.update(category_params)

      flash.notice = "Category '#{@category.name}' Updated!"
      redirect_to admin_categories_path()
    end  

    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to admin_categories_path
    end

  end
end