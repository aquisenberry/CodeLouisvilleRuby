require 'spec_helper'

describe User do
	let(:valid_attributes) {
		{
			first_name: "Anthony",
			last_name: "Quisenberry",
			email_address: "anthony@gmail.com",
			password: "tree1234",
			password_confirmation: "tree1234"
		}
	}
  context "validations" do
  	let(:user){ User.new(valid_attributes)}
  	before do
  		User.create(valid_attributes)
  	end

  	it "requires an email" do
  		expect(user).to validate_presence_of(:email_address);
  	end

  	it "requires a unique email" do
  		expect(user).to validate_uniqueness_of(:email_address);
  	end

  	it "requires a unique email (case insensitive)" do
  		user.email_address = "ANTHONY@gmail.com"
  		expect(user).to validate_uniqueness_of(:email_address)
  	end

  	it "requires email to look like an email" do
  		user.email_address = "Anthony"
  		expect(user).to_not be_valid
  	end
  	
  end

  describe "#downcase_email" do
  	it "makes the email attribute lowercase" do
  		user = User.new(valid_attributes.merge(email_address: "ANTWON@gmail.com"))
  		user.downcase_email
  		expect(user.email_address).to eq("antwon@gmail.com")
  	end

  	it "downcases an email before saving" do
  		user = User.new(valid_attributes)
  		user.email_address = "JUAN@GMAIL.COM"
  		expect(user.save).to be_truthy
  		expect(user.email_address).to eq("juan@gmail.com")
  	end
  end
end
