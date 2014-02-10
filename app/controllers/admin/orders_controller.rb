module Admin
  class OrdersController < ApplicationController
  before_filter :require_login
  include OrdersHelper

    def index
      @orders = Order.all
       @orders_counts = Order.group('status').count
    end

    def show 
      @order = Order.find(params[:id])
      render 'admin/orders/show.html.erb'
    end

    def update
      @order = Order.find(params[:id])
      @order.order_items.each do |order_item| 
        order_item.quantity = params["quantity_#{order_item.id}"]
        order_item.save!
      end
      flash.notice = "Order Updated!"
      redirect_to admin_order_path(params[:id])
    end 

    def admin_remove_item
      @order_item = Order.order_items.find(params[:id])
      @order_item.destroy
      redirect_to order_path(order)
    end

    def status_filter
      @orders = Order.where('status = ?', params[:status])
      orders_counts
      render 'admin/orders/index.html.erb'
    end

    def status_change
      order = Order.find(params[:id])
      order.status = params[:status]
      order.save!
      flash.notice = "Order status Changed!"
      redirect_to order_path(order)
    end

    private 

    def orders_counts
      @orders_counts = Order.group('status').count
    end

  end
end