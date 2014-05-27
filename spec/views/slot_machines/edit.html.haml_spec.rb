require 'spec_helper'

describe "slot_machines/edit" do
  before(:each) do
    @slot_machine = assign(:slot_machine, stub_model(SlotMachine,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit slot_machine form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", slot_machine_path(@slot_machine), "post" do
      assert_select "input#slot_machine_name[name=?]", "slot_machine[name]"
      assert_select "textarea#slot_machine_description[name=?]", "slot_machine[description]"
    end
  end
end
