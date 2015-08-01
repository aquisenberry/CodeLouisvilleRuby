require "spec_helper"

describe "Signing Up" do
	it "allows a user to register for the site and creates an object in the database" do
		expect(User.count).to eq(0)

		visit new_user_path
		fill_in "First Name", with: "Anthony"
		fill_in "Last Name", with: "Quisenberry"
		fill_in "Email Address", with: "anthony@gmail.com"
		fill_in "Password", with: "tree1234"
		fill_in "Password Confirmation", with: "tree1234"
		click_button "Register User"

		expect(User.count).to eq(1)
	end
end