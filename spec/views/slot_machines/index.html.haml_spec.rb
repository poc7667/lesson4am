require 'spec_helper'

describe "slot_machines/index" do
  before(:each) do
    assign(:slot_machines, [
      stub_model(SlotMachine,
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(SlotMachine,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of slot_machines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
