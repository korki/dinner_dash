require 'spec_helper'

describe Category do
  let(:test_cat1) { Category.new({
    id: '1',
    name: 'Starters',
   })  
  }

  let(:test_cat2) { Category.new({
    id: '2',
    name: 'Main Meals',
   })  
  }

  it 'it has an id and a name' do

    expect(test_cat1.id).to eq 1
    expect(test_cat1.name).to eq "Starters"

    expect(test_cat2.id).to eq 2
    expect(test_cat2.name).to eq "Main Meals"
  end

  it 'Go to main Category page' do
    visit categories_path
    expect(page.status_code).to eq 200
  end

  it "Adds a category" do

    
  end

end