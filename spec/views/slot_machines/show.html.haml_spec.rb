require 'spec_helper'

describe "slot_machines/show" do
  before(:each) do
    @slot_machine = assign(:slot_machine, stub_model(SlotMachine,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
