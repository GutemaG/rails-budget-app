require 'rails_helper'

RSpec.describe 'group', type: :feature do
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

  context 'The page should display groups and its total amount' do
    it 'should display the group name and total amount' do
      expect(page).to have_content('Groups')
      expect(page).to have_content('600')
    end
  end

  context 'Test New category button' do
    it 'Add New Group button should redirect to the create Group form ' do
      click_link 'Add New Group'
      expect(current_path).to eq(@new_group_url)
    end
    it 'should display the page name' do
      click_link 'Add New Group'
      expect(page).to have_content('New Group')
    end
  end

  context 'Test click on Group' do
    before :each do
      click_link 'House'
    end

    it 'On click in Group should show lists of costs' do
      expect(current_path).to eq(group_costs_path(@group))
    end
    it 'should display the cost names' do
      expect(page).to have_content('food')
    end

    it 'should display the Costs amounts' do
      expect(page).to have_content('400')
      expect(page).to have_content('200')
    end
  end
end
