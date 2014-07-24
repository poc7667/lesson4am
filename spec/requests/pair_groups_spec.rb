require 'rails_helper'

RSpec.describe "PairGroups", :type => :request do
  describe "GET /pair_groups" do
    it "works! (now write some real specs)" do
      get pair_groups_path
      expect(response.status).to be(200)
    end
  end
end
