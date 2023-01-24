require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end
  

  describe "Users connexions" do
    it "(sign up/sign in)" do
      user = User.new()
      user.email = "hype@hype.com"
      user.pseudo = "bob"
      #user.admin = nil
      user.password = "123456"
      user.save
      confirmation = User.first.confirmation_token
      visit "http://localhost:3000/users/confirmation?confirmation_token=" + confirmation
      
      within('form') do
        fill_in "Email", with: "hype@hype.com"
        fill_in "Password", with: "123456"
      end
      #byebug
      click_button "Log in"
      
      expect(page).to have_content("Signed in successfully.")
    end

    it "connection failure (Invalid Email or password.)" do
    
      visit new_user_session_path 
      user = User.new()
      user.email = "hype@hype.com"
      user.pseudo = "bob"
      #user.admin = nil
      user.password = "123456"
      user.save
      confirmation = User.first.confirmation_token
      visit "http://localhost:3000/users/confirmation?confirmation_token=" + confirmation
      
      within('form') do
        fill_in "Email", with: "hype@hype.com"
        fill_in "Password", with: "12345"
      end
          #byebug
      click_button "Log in"
      
      expect(page).to have_content("Invalid Email or password.")
    end

    it "admin user" do
        user = User.new()
        user.email = "hype@hype.com"
        user.pseudo = "bob"
        user.admin = true
        user.password = "123456"
        user.save
        confirmation = User.first.confirmation_token
        visit "http://localhost:3000/users/confirmation?confirmation_token=" + confirmation
        
        within('form') do
          fill_in "Email", with: "hype@hype.com"
          fill_in "Password", with: "123456"
        end
        #byebug
        click_button "Log in"
      
      expect(page).to have_content("Admin")
  
    end

  end

  it "logout all listing" do
    
    visit "http://localhost:3000/products" 
    expect(page).to have_content("All listing")

  end
  

  describe "Users CRUD" do

    before do

       user = User.new()
      user.email = "hype@hype.com"
      user.pseudo = "bob"
      #user.admin = nil
      user.password = "123456"
      user.save
      confirmation = User.first.confirmation_token
      visit "http://localhost:3000/users/confirmation?confirmation_token=" + confirmation
      
      within('form') do
        fill_in "Email", with: "hype@hype.com"
        fill_in "Password", with: "123456"
      end
      #byebug
      click_button "Log in"
    
    end
    
    it "Edit" do
     
      visit "http://localhost:3000/users/edit" 
      
      fill_in "Email", with: "hype@hype.com"
      fill_in "Password", with: "123456"
      fill_in "Password confirmation", with: "123456"
      fill_in "Current password", with: "123456"
      
      click_button "Update"
      expect(page).to have_content("Your account has been updated successfully.")
    end

    it "Destroy" do
     
      #click_link('id-of-link')
      #visit "http://localhost:3000/home/private"
      visit "http://localhost:3000/users/edit" 
      find("#cancel").click
      #click_link('Cancel my account')
      #byebug
      expect(page).to have_content("Your account has been successfully cancelled")
    end

    it "Read" do
     
      visit "http://localhost:3000/home/private"
      expect(page).to have_content("bob")
    end

  end

end
