require 'rails_helper'
RSpec.describe 'User management function', type: :system do
describe 'Sign_up users function' do
    context 'When user create a restaurant' do
    it 'User Should Sign_up for restaurant crate page' do
    visit new_user_registration_path
    fill_in 'Email', with:  'tess1@me.com'
    fill_in 'Password *', with: 'secrets'
    fill_in 'Password confirmation *', with: 'secrets'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
end
describe 'Session functionality test' do
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
      it 'enables login' do
        expect(page).to have_content 'Signed in successfully'
      end
    end
    context 'to be able to logout' do
      it 'enables logout' do
        click_on "Log Out"
        expect(page).to have_content 'Signed out successfully'
      end
    end
  end

end
