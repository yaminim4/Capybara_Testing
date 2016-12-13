require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  # subject(:user) do
  #   FactoryGirl.create(:user,
  #     username: "jonathan",
  #     password: "good_password")
  # end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    # context "with valid params" do
    #   it "signs in user" do
    #     test_user = FactoryGirl.create(:user)
    #     # debugger
    #     post :create, user: { username: test_user.username, password: test_user.password }
    #     expect(current_user).to be_truthy
    #   end
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
