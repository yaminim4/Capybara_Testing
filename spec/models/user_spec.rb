require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    FactoryGirl.create(:user,
      username: "jonathan",
      password: "good_password")
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe ".find_by_credentials" do
    it "finds user by username" do
      test_find = User.find_by_credentials(user.username, user.password)
      expect(test_find).to be_truthy
      #expect(test_find).to eql(user)
    end
  end


end
