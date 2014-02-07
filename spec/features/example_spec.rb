require 'spec_helper'

describe 'example that navigates the app' do
  it 'can hit the root of my app' do
    visit root_url
    expect(page).to have_content 'Dinner Dash'
    expect(page.status_code).to eq 200
  end
end
