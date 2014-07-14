require_relative '../spec_helper.rb'

describe Honkr::User do

  before do
    @user = Honkr::User.new(55, "joe")
  end

  describe "initialize" do
    it "initializes a username and password_digest" do
      pending "You need to implement password hashing first"
      @user.update_password("joe's password")

      expect(user.id).to eq(55)
      expect(user.username).to eq("joe")

      expect(user.has_password? "joe's password").to eq true
    end
  end

  describe "update_password" do
    it "hashes a password using SHA2" do
      encypted_password = "b9c950640e1b3740e98acb93e669c65766f6670dd1609ba91ff41052ba48c6f3"
      result = @user.update_password("password1234")

      expect(result).to eq(encypted_password)
    end
  end

  describe "has_password?" do

  end
end
