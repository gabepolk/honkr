require 'spec_helper.rb'

describe Honkr::Honk do

  describe "initialize" do
    it "initializes with id, user_id, and content" do
      honk = Honkr::Honk.new(10, 20, "hello")
      expect(honk.id).to eq(10)
      expect(honk.user_id).to eq(20)
      expect(honk.content).to eq("hello")
    end
  end
end
