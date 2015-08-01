require "spec_helper"

describe "Signing In" do
	it "signs the user in and takes them to their home page" do
		user = User.create(first_name: "Anthony", last_name: "Quisenberry", email_address: "anthony@qw.com", password: "1234", password_confirmation: "1234")
		visit new_user_session_path
		fill_in "Email Address", with: user.email_address
		fill_in "Password", with: user.password
		click_button "Sign In"

		expect(page).to have_content("Anthony")
		
	end
	it "displays the email address in the event of a failed sign in" do
		visit new_user_session_path
		fill_in "Email Address", with: "anthony@quisenberry.com"
		fill_in "Password", with: "incorrect"
		click_button "Sign In"

		expect(page).to have_content("Please check your email and password")
		expect(page).to have_field( "Email Address", with: "anthony@quisenberry.com")
	end
end