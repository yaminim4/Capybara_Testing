require 'spec_helper'
require 'rails_helper'
feature "authenticate" do
  let(:test_user) { FactoryGirl.create(:user) }
  feature "the signup process" do
    scenario "has a new user page" do
      visit new_user_url
      expect(page).to have_content "Sign Up"
    end

    feature "signing up a user" do
      scenario "shows username on the homepage after signup" do
        visit new_user_url
        fill_in "username", with: "andrew"
        fill_in "password", with: "password"
        click_on("Submit")
        expect(page).to have_content "andrew"
      end

    end

  end

  feature "logging in" do

    let(:yamini) { FactoryGirl.create(:user, username: "yamini", password: "yamini123") }
    scenario "shows username on the homepage after login" do
      visit new_session_url
      fill_in "username", with: yamini.username
      fill_in "password", with: "yamini123"
      click_on("Submit")
      expect(page).to have_content yamini.username
    end

  end

  feature "logging out" do

    scenario "begins with a logged out state" do
      visit new_user_url
      find_link("Sign Up").visible?
      find_link("Sign In").visible?
    end

    scenario "doesn't show username on the homepage after logout" do
      #logged_out_user = FactoryGirl.create(:user, session_token: nil)
      visit new_user_url
      expect(page).to_not have_content test_user.username
    end

  end
end
