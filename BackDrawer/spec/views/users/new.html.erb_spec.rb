require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :first_name => "MyString",
      :last_name => "MyString",
      :email_address => "MyString",
      :password_digest => "MyString"
    ).as_new_record)
  end

  # it "renders new user form" do
  #   render

  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   # assert_select "form[action=?][method=?]", users_path, "post" do
  #   #   assert_select "input#user_first_name[name=?]", "user[first_name]"
  #   #   assert_select "input#user_last_name[name=?]", "user[last_name]"
  #   #   assert_select "input#user_email_address[name=?]", "user[email_address]"
  #   #   assert_select "input#user_password_digest[name=?]", "user[password_digest]"
  #   end
  # end
end
