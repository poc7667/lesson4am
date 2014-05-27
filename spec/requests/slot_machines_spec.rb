require 'spec_helper'

describe "SlotMachines" do
  describe "GET /slot_machines" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get slot_machines_path
      response.status.should be(200)
    end
  end
end
