require_relative './test_helper'

feature 'home page displays log in forms' do
  before :each do
    clear_database
  end
  scenario 'test home page' do
    visit('/')
    expect(page).to have_content('Sign Up')
  end
end
