require 'rails_helper'

RSpec.describe "JosephMemos", :type => :request do
  describe "GET /joseph_memos" do
    it "works! (now write some real specs)" do
      get joseph_memos_path
      expect(response.status).to be(200)
    end
  end
end
