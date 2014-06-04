require 'spec_helper'

describe "buy_houses/show" do
  before(:each) do
    @buy_house = assign(:buy_house, stub_model(BuyHouse,
      :user_id => 1,
      :age => 2,
      :gender => "Gender",
      :monthly_income => 1.5,
      :job => "MyText",
      :expenditure => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Gender/)
    rendered.should match(/1.5/)
    rendered.should match(/MyText/)
    rendered.should match(//)
  end
end
