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
      Category.create(name: 'Fast Food')
      @category = Category.first
     visit root_path
     click_on 'Add Restaurant'
     select 'Fast Food'
     fill_in 'Name', with: 'Addis'
     fill_in 'Address', with: 'hatagaya'
     fill_in 'Description', with: 'serving traditional foods'
     attach_file "/home/meklu/Desktop/saiz.png"
     click_button 'Create Restaurant'
     expect(page).to have_content 'New Restaurant added'

   end
 end
end
end
    describe 'Edit restaurant function' do
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
    Category.create(name: 'Fast Food')
    @category = Category.first
    visit root_path
    click_on 'Add Restaurant'
    select 'Fast Food'
    fill_in 'Name', with: 'Addis'
    fill_in 'Address', with: 'hatagaya'
    fill_in 'Description', with: 'serving traditional foods'
    attach_file "/home/meklu/Desktop/saiz.png"
    click_button 'Create Restaurant'
    expect(page).to have_content 'New Restaurant added'
    click_on 'click to review'
    click_on 'Edit Restarant'
    select 'Fast Food'
    fill_in 'Name', with: 'Addis'
    fill_in 'Address', with: 'Shinjuku'
    fill_in 'Description', with: 'serving traditional foods'
    attach_file "/home/meklu/Desktop/saiz.png"
    click_button "Update Restaurant"
    end
 end
 end
 describe 'Delete restaurant function' do
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
   Category.create(name: 'Fast Food')
   @category = Category.first
   visit root_path
   click_on 'Add Restaurant'
   select 'Fast Food'
   fill_in 'Name', with: 'Addis'
   fill_in 'Address', with: 'hatagaya'
   fill_in 'Description', with: 'serving traditional foods'
   attach_file "/home/meklu/Desktop/saiz.png"
   click_button 'Create Restaurant'
   expect(page).to have_content 'New Restaurant added'
   click_on 'click to review'
   click_on 'Delete Restaurant'
 end
end
end
