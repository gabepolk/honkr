require_relative '../spec_helper.rb'
require 'digest'

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
      encrypted_password = Digest::SHA2.hexdigest("cheerios")
      @user.update_password("cheerios")

      expect(@user.password_digest).to eq(encrypted_password)
    end
  end

  describe "has_password?" do
    context "when the password exists" do
      it "returns 'true'" do
        @user.update_password("cheerios")
        encrypted_password = Digest::SHA2.hexdigest("cheerios")
        result = @user.has_password?("cheerios")

        expect(result).to eq(true)
      end
    end

    context "when the password doesn't exist" do
      it "returns 'false'" do
        @user.update_password("chex")
        encrypted_password = Digest::SHA2.hexdigest("chex")
        result = @user.has_password?("cheerios")

        expect(result).to eq(false)
      end
    end
  end
end
