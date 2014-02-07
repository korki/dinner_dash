require 'spec_helper'

describe 'Orders' do

  before(:each) do
    @order = Order.first
  end

  describe 'User pages' do
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

  describe 'Admin pages' do
    it 'visits dashboard and shows orders results' do
      visit admin_orders_url
      expect(page.body).to have_content 'completed (1)'
      expect(page.body).to have_content 'Order id: 1'
      expect(page.body).to have_content 'Order id: 2'
      expect(page.status_code).to eq 200
    end

    it 'can filter by status' do
      visit admin_orders_url
      within("#status_filter") do
        click_link 'completed'
      end
      expect(page.body).to have_content 'Order id: 1'
      expect(page.body).not_to have_content 'Order id: 2'
      expect(page.status_code).to eq 200
    end

    it 'visits single order and displays user info' do
      user = User.new role: 1
      ApplicationController.any_instance.stub(:current_user).and_return(user)
      visit order_url(@order.id)
      expect(page.body).to have_content "Order ##{@order.id}"
      expect(page.body).to have_content "User: #{@order.user.full_name} (#{@order.user.email})"
      expect(page.status_code).to eq 200
    end

    it 'can change the status of order' do
      visit admin_orders_url
      within("#orders_list") do
        click_link 'canceled'
      end
      expect(page.body).to have_content "Status: canceled"
      expect(page.status_code).to eq 200
    end
  end
end
