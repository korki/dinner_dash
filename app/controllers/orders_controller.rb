class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: 1)#current_user.id)
    render 'index.html.erb'
  end

  def show
    @order = Order.find(params[:id])
  end

  def admin_index
    @orders = Order.all
    orders_counts
    render 'admin/orders/index.html.erb'
  end

  def admin_status_filter
    @orders = Order.where('status = ?', params[:status])
    orders_counts
    render 'admin/orders/index.html.erb'
  end

  def admin_status_change
    order = Order.find(params[:id])
    order.status = params[:status]
    order.save!
    redirect_to order_path(order)
  end

  private 

  def orders_counts
    @orders_counts = Order.group('status').count
  end
end
