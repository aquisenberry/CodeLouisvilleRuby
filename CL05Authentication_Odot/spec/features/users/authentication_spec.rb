require "spec_helper"

describe "Logging in" do
	
	it "logs user in and goes to the todo lists" do 
		user = User.create(first_name: "Anthony", last_name: "Quisenberry", email: "anthony.quisenberry@gmail.com", password: "treehouse1", password_confirmation: "treehouse1")
		visit new_user_session_path
		fill_in "Email Address", with: user.email
		fill_in "Password", with: user.password
		click_button "Log In"

		expect(page).to have_content("Todo Lists")
	end

	it "displays email address in event of a failed login" do
		visit new_user_session_path
		fill_in "Email Address", with: "anthony.quisenberry@gmail.com"
		fill_in "Password", with:"bleh"
		click_button "Log In"

		expect(page).to have_content("Please check your credentials.")
		expect(page).to have_field("Email Address", with: "anthony.quisenberry@gmail.com")
	end
end