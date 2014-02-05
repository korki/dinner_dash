require 'spec_helper'

describe 'example that navigates the app' do
  it 'can hit the root of my app' do
    visit root_url
    expect(page.body).to eq 'all good, mate!'
    expect(page.status_code).to eq 200
  end
end
