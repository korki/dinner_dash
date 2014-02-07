require 'spec_helper'

describe 'Product Management Module' do

  describe 'Product Create Module' do
    let :item do
      Item.create(name: 'Burger', description: 'Chicken Burger', price: '18', quantity: '5') 
    end

    it 'Go to main items page' do
      visit items_url
      expect(page.status_code).to eq 200
    end

    it 'It has item name, price, description and quantity' do
      expect(item.name).to eq 'Burger'
      expect(item.description).to eq 'Chicken Burger'
      expect(item.price).to eq 18
      expect(item.quantity).to eq 5
    end
  end

  describe 'Product Details Module' do

    before(:each) do
      @item = Item.first
    end

    it 'It has item details and product info' do
      visit item_url(@item.id)
      expect(page.body).to have_content "Stella"
      expect(page.body).to have_content "Beer"
      expect(page.body).to have_content "Price : 5"
      expect(page.body).to have_content "Quantity : 0"
    end

    it 'It has edit item add new item page' do
      visit item_url(@item.id)
      expect(page.status_code).to eq 200
    end
  end


   describe 'Product Admin Module' do

    before(:each) do
      @item = Item.first
    end

    it 'Only Admin can create/edit/update items details' do
    end

    it 'It has edit item add new item page' do
    end
  end


end



