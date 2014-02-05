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
    render 'orders/admin/index.html.erb'
  end
end
