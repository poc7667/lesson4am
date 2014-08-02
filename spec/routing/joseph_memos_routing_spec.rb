require "rails_helper"

RSpec.describe JosephMemosController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/joseph_memos").to route_to("joseph_memos#index")
    end

    it "routes to #new" do
      expect(:get => "/joseph_memos/new").to route_to("joseph_memos#new")
    end

    it "routes to #show" do
      expect(:get => "/joseph_memos/1").to route_to("joseph_memos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/joseph_memos/1/edit").to route_to("joseph_memos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/joseph_memos").to route_to("joseph_memos#create")
    end

    it "routes to #update" do
      expect(:put => "/joseph_memos/1").to route_to("joseph_memos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/joseph_memos/1").to route_to("joseph_memos#destroy", :id => "1")
    end

  end
end
