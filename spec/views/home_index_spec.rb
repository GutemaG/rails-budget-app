require 'rails_helper'

RSpec.describe 'Home Page', type: :system, js: true do
  include Warden::Test::Helpers
  describe 'Home page' do
    before(:each) do
      visit root_path
    end

    it 'Should display welome message' do
      expect(page).to have_content('Welcome To Simple Pay')
    end

    it 'Should have Login button' do
      expect(page).to have_content('LOGIN')
    end

    it 'Should have Sign up button' do
      expect(page).to have_content('SIGN UP')
    end

    it 'It should redirect to login page' do
      click_link 'LOGIN'
      expect(page).to have_current_path(new_user_session_path)
    end

    it 'It should redirect to sign up page' do
      click_link 'SIGN UP'
      expect(page).to have_current_path(new_user_registration_path)
    end
  end

  describe 'Login page' do
    before(:each) do
      @user = User.create(name: 'Birhanu Gudsia', email: 'test12@gmail.com', password: 'testing12')
      login_as(@user, scope: :user)
      visit groups_path
    end

    it 'Should Display Groups' do
      expect(page).to have_current_path(groups_path)
    end
  end
end
