require 'spec_helper'

describe UserSessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "renders new template" do
      get 'new'
      expect(response).to render_template('new')
    end
  end

  describe "Post 'create'" do
    context "with correct credentials"do
      let!(:user){User.create(first_name: "Anthony", last_name: "Quisenberry", email_address: "anthony@gmail.com", password: "tree123", password_confirmation: "tree123")}
      it "redirects to the user's home panel" do
        post :create, email_address: "anthony@gmail.com", password: "tree123"
        expect(response).to be_redirect
        expect(response).to redirect_to(user_path(session[:user_id]))
      end

      it "finds the user" do
        expect(User).to receive(:find_by).with({email_address:"anthony@gmail.com"}).and_return(user)
        post :create, email_address: "anthony@gmail.com", password: "tree123"
      end

      it "authenticates the user" do
        User.stub(:find_by).and_return(user)
        expect(user).to receive(:authenticate)
        post :create, email_address: "anthony@gmail.com", password: "tree123"
      end

      it "sets the userid in the session" do
        post :create, email_address: "anthony@gmail.com", password: "tree123"
        expect(session[:user_id]).to eq(user.id)
      end
    end

    shared_examples_for "denied login" do
       it "renders the new template" do
        post :create, email_address: email_address, password: password
        expect(response).to render_template('new')
      end

      it "sets flash error message" do
        post :create, email_address: email_address, password: password
        expect(flash[:error]).to eq("There was a problem logging in. Please check your email and password.")
      end
    end

    context "with blank credentials"do
      let(:email_address){""}
      let(:password){""}
      it_behaves_like "denied login"
    end

    context "with incorrect password"do
      let!(:user){User.create(first_name: "Anthony", last_name: "Quisenberry", email_address: "anthony@gmail.com", password: "tree123", password_confirmation: "tree123")}
      let(:email_address){user.email_address}
      let(:password){"sdf"}
      it_behaves_like "denied login"
      
    end
    context "with no email in existence" do
      let(:email_address){"none@that.com"}
      let(:password){"sdf"}
      it_behaves_like "denied login"
    end
    
  end

end
