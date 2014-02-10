require 'spec_helper'

describe 'Orders' do

  before(:each) do
    @order = Order.first
    user = User.new(role: 0, id: 1)
    ApplicationController.any_instance.stub(:current_user).and_return(user)
  end

  it 'visits index and list all orders' do
    visit orders_url
    expect(page.body).to have_content 'Your orders'
    expect(page.body).to have_content 'Order #1'
    expect(page.status_code).to eq 200
  end

  it 'visits single order page and displays details' do
    visit order_url(@order.id)
    expect(page.body).to have_content "Order ##{@order.id}"
    expect(page.body).not_to have_content "User: #{@order.user.full_name} (#{@order.user.email})"
    expect(page.status_code).to eq 200
  end
end
