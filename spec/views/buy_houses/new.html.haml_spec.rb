require 'spec_helper'

describe "buy_houses/new" do
  before(:each) do
    assign(:buy_house, stub_model(BuyHouse,
      :user_id => 1,
      :age => 1,
      :gender => "MyString",
      :monthly_income => 1.5,
      :job => "MyText",
      :expenditure => ""
    ).as_new_record)
  end

  it "renders new buy_house form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", buy_houses_path, "post" do
      assert_select "input#buy_house_user_id[name=?]", "buy_house[user_id]"
      assert_select "input#buy_house_age[name=?]", "buy_house[age]"
      assert_select "input#buy_house_gender[name=?]", "buy_house[gender]"
      assert_select "input#buy_house_monthly_income[name=?]", "buy_house[monthly_income]"
      assert_select "textarea#buy_house_job[name=?]", "buy_house[job]"
      assert_select "input#buy_house_expenditure[name=?]", "buy_house[expenditure]"
    end
  end
end
