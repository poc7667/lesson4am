require 'spec_helper'

describe "BuyHouses" do
  describe "GET /buy_houses" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get buy_houses_path
      response.status.should be(200)
    end
  end
end
