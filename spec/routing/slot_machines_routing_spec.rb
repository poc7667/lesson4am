require "spec_helper"

describe SlotMachinesController do
  describe "routing" do

    it "routes to #index" do
      get("/slot_machines").should route_to("slot_machines#index")
    end

    it "routes to #new" do
      get("/slot_machines/new").should route_to("slot_machines#new")
    end

    it "routes to #show" do
      get("/slot_machines/1").should route_to("slot_machines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/slot_machines/1/edit").should route_to("slot_machines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/slot_machines").should route_to("slot_machines#create")
    end

    it "routes to #update" do
      put("/slot_machines/1").should route_to("slot_machines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/slot_machines/1").should route_to("slot_machines#destroy", :id => "1")
    end

  end
end
