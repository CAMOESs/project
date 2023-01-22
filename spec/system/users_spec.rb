require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end
  describe "Users connexion" do
    it "enables to create a new session" do
      user = User.new()
      user.email = "hypes@hype.com"
      user.pseudo = "bob"
      #user.admin = nil
      user.password = "babayaga"
      user.save
      get "/users/sign_in"
      #byebug
      #fill_in "Email", with: user.email
      find_field('Email').set(user.email)
      byebug
      fill_in "Password", with: user.password
      click_button "Log in"
      
      expect(page).to have_text("Signed in successfully.")
    end
  end
end
