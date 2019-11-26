require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  subject(:user) do
    FactoryBot.build(:user,
    username: "testuser",
    password: "good_password")
  end

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  
  it "creates a password digest when a password is given" do
    expect(user.password_digest).to_not be_nil
  end

  it "creates a session token before validation" do
    expect(user.session_token).to_not be_nil
  end

  describe "#is_password?" do
    it "should return true if password is correct" do
      expect(user.is_password?("good_password")).to be true
    end

    it "should return false if password is not correct" do
      expect(user.is_password?("bad_password")).to be false
    end
  end

  describe "#reset_session_token!" do
    it "should set new session token on user" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_session_token)
    end

    it "should return new session token on user" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do
    it "should return user given good credentials" do
      user = User.create(username: "testuser", password: "good_password")
      expect(User.find_by_credentials("testuser", "good_password")).to eq(user)
    end

    it "should return nil given bad credentials" do
      expect(User.find_by_credentials("baduser", "bad_password")).to eq(nil)
    end
  end

end
