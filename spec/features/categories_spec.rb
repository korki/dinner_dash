require 'spec_helper'

describe Category do
  let(:test_cat1) { Category.new({
    id: '1',
    name: 'Starters',
   })  
  }

  it 'displays main categories list and single category' do
    cat = Category.first
    visit categories_path
    expect(page.status_code).to eq 200
    expect(page.body).to have_content cat.name
    visit items_category_path cat.id
    expect(page.status_code).to eq 200
    expect(page.body).to have_content cat.name
  end

  it "adds a new category" do
    visit new_category_path
    fill_in 'category[name]', :with => 'test_category'
    click_on 'Create Category'
    expect(page.status_code).to eq 200
    expect(page.body).to have_content 'test_category'
  end

end