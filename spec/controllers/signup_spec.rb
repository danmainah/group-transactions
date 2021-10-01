require 'rails_helper'

describe 'Controller', type: :system do
  describe 'Signing up new user' do
    before :each do
      visit new_user_path
    end
    it 'should not work without username' do
      fill_in 'user[username]', with: 'blac'
      click_button 'Create User'
      sleep(2)
      expect(page).to have_content('is too short')
    end

    it 'should not work without password' do
      click_button 'Create User'
      sleep(2)
      expect(page).to have_content("can't be blank")
    end

    it 'signs up with correct details' do
      fill_in 'user[username]', with: 'Xavier'
      click_button 'Create User'
      sleep(2)
      expect(page).to have_content('User account successfully created.')
    end
  end
end
