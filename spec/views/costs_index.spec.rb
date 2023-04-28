require 'rails_helper'

RSpec.describe 'Costs', type: :feature do
  include Warden::Test::Helpers
  before :each do
    @user = User.create!(name: 'tester', email: 'test@gmail.com', password: 'testing12')
    login_as(@user, scope: :user)

    @group = Group.create!(name: 'House',
                           icon: 'https://www.shutterstock.com/image-photo/mountains-under-mist-morning-amazing-260nw-1725825019.jpg',
                           author: @user)
    @cost1 = Cost.create!(name: 'electronics', amount: 400, author_id: @user.id, groups: [@group])
    @cost2 = Cost.create!(name: 'food', amount: 200, author_id: @user.id, groups: [@group])

    visit groups_path
    @new_group_url = new_group_path
    @cost_url = group_path(@group)
    @main_page_url = groups_path
  end

  context 'testing New trasaction button' do
    before :each do
      click_link 'New Transaction'
    end
    it 'New Transaction button should redirect to the create Transaction form ' do
      expect(current_path).to eq(new_group_cost_path)
    end

    it 'Should have correct title page' do
      expect(page).to have_content('New Transaction')
    end
  end
end
