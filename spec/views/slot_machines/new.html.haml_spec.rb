require 'spec_helper'

describe "slot_machines/new" do
  before(:each) do
    assign(:slot_machine, stub_model(SlotMachine,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new slot_machine form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", slot_machines_path, "post" do
      assert_select "input#slot_machine_name[name=?]", "slot_machine[name]"
      assert_select "textarea#slot_machine_description[name=?]", "slot_machine[description]"
    end
  end
end
