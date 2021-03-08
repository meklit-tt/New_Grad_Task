require 'rails_helper'
RSpec.describe 'Restaurant review function', type: :system do
  describe 'Create restaurant function' do
      before do
        User.create(email: 'test1@gmail.com',
                    password: 'passwd',
                    password_confirmation: 'passwd')
        visit new_user_session_path
        fill_in 'Email', with: 'test1@gmail.com'
        fill_in 'Password', with: 'passwd'
        click_button 'Log in'
        @user = User.first
      end
      context 'to be able to login' do
      it 'enables create new restaurant' do
      expect(page).to have_content 'Signed in successfully'
end
end 
end
end
