require "spec_helper"

describe BuyHousesController do
  describe "routing" do

    it "routes to #index" do
      get("/buy_houses").should route_to("buy_houses#index")
    end

    it "routes to #new" do
      get("/buy_houses/new").should route_to("buy_houses#new")
    end

    it "routes to #show" do
      get("/buy_houses/1").should route_to("buy_houses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/buy_houses/1/edit").should route_to("buy_houses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/buy_houses").should route_to("buy_houses#create")
    end

    it "routes to #update" do
      put("/buy_houses/1").should route_to("buy_houses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/buy_houses/1").should route_to("buy_houses#destroy", :id => "1")
    end

  end
end
