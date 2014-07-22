require "rails_helper"

RSpec.describe PairGroupsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pair_groups").to route_to("pair_groups#index")
    end

    it "routes to #new" do
      expect(:get => "/pair_groups/new").to route_to("pair_groups#new")
    end

    it "routes to #show" do
      expect(:get => "/pair_groups/1").to route_to("pair_groups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pair_groups/1/edit").to route_to("pair_groups#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pair_groups").to route_to("pair_groups#create")
    end

    it "routes to #update" do
      expect(:put => "/pair_groups/1").to route_to("pair_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pair_groups/1").to route_to("pair_groups#destroy", :id => "1")
    end

  end
end
