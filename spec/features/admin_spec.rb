require 'spec_helper'

describe 'Admin panel' do

  before(:each) { i_am_logged_in_as user }

  let(:order) { Order.first }

   let :user do
      User.create(full_name:             'tony',
                  display_name:          'tonyk',
                  email:                 't@t.com',
                  password:              'password',
                  password_confirmation: 'password',
                  role:                  '1')
   end

  describe 'Admin Order pages' do
    it 'visits dashboard and shows orders results' do
      visit admin_orders_url
      expect(page.body).to have_content "completed (#{Order.where(status: 'completed').count})"

      expect(Order.count).to be > 0
      Order.all.each do |order|
        expect(page.body).to have_content "Order id: #{order.id}"
      end
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
      visit admin_order_url(order.id)
      expect(page.body).to have_content "Order ##{order.id}"
      expect(page.body).to have_content "User: #{order.user.full_name} (#{order.user.email})"
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

    it 'can edit orders quantity in status pending or paid' do
      visit login_url
      fill_in 'email', :with => user.email
      fill_in 'password', :with => 'password'
      click_on 'Login'
      order.status = 'paid'
      order.save!
      visit admin_order_url(order.id)
      fill_in 'quantity_1', :with => '99'
      click_on 'Update'
      page.should have_content order.order_items.find('1').item.price * 99
    end
  end
end
