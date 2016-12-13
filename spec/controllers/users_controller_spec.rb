require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    context "with valid params" do

      it "creates a user" do
        test_user = FactoryGirl.create(:user)
        post :create, user: { username: test_user.username }
        expect(User.last.username).to eql(test_user.username)
        expect(response).to redirect_to links_url
      end
    end

    context "with invalid params" do

      it "redirects to sign up page with invalid username" do
        post :create, user: { username: 6, password: "password" }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

      it "redirects to sign up page with invalid password" do
        post :create, user: { password: "o" }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end     
    end

  end

end
