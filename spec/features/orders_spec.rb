require 'spec_helper'

describe 'Orders' do
  # fixtures :orders

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
      pending
      visit order_url(@order.id)
      expect(page.body).to have_content 'Order #1'
      expect(page.body).not_to have_content 'User: Franklin Webber (franklin.webber@testingstuff.com)'
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
      visit order_url(@order.id)
      expect(page.body).to have_content 'Order #1'
      expect(page.body).to have_content 'User: Franklin Webber (franklin.webber@testingstuff.com)'
      expect(page.status_code).to eq 200
    end

    it 'can change the status of order' do
      pending
      visit admin_orders_url
      within("#orders_list") do
        click_link 'completed'
      end
      
      expect(page.status_code).to eq 200
    end
  end
end
