require 'rails_helper'
RSpec.describe 'Restaurant review function', type: :system do

describe 'Create Category function' do
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
  it 'enables create new Category' do
  expect(page).to have_content 'Signed in successfully'
   visit root_path
   click_on 'Add category'
   fill_in 'Name', with: 'Family Style'
   click_button 'Create Category'
   expect(page).to have_content 'category was successfully created.'

end
end
end

describe 'Edit Category function' do
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
  it 'enables edit new category' do
  expect(page).to have_content 'Signed in successfully'
   visit root_path
   click_on 'Add category'
   fill_in 'Name', with: 'Family Style'
   click_button 'Create Category'
   expect(page).to have_content 'category was successfully created.'
   click_on 'Edit'
   fill_in 'Name', with: 'Casual'
   click_button 'Update Category'
   expect(page).to have_content 'category was successfully updated.'
end
end
end
describe 'searh by Category function' do
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
  it 'enables search new Category' do
  expect(page).to have_content 'Signed in successfully'
   visit root_path
   click_on 'Categories'
   expect(page).to have_content 'There are no restaurant added in this category'

end
end
end

describe 'Delete Category function' do
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
  it 'enables Delete new Category' do
  expect(page).to have_content 'Signed in successfully'
   visit root_path
   click_on 'Add category'
   fill_in 'Name', with: 'Family Style'
   click_button 'Create Category'
   expect(page).to have_content 'category was successfully created.'
   click_on 'Delete'

end
end
end
end
