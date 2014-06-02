require 'spec_helper'

describe "buy_houses/index" do
  before(:each) do
    assign(:buy_houses, [
      stub_model(BuyHouse,
        :user_id => 1,
        :age => 2,
        :gender => "Gender",
        :monthly_income => 1.5,
        :job => "MyText",
        :expenditure => ""
      ),
      stub_model(BuyHouse,
        :user_id => 1,
        :age => 2,
        :gender => "Gender",
        :monthly_income => 1.5,
        :job => "MyText",
        :expenditure => ""
      )
    ])
  end

  it "renders a list of buy_houses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
