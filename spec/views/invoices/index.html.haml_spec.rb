require 'rails_helper'

RSpec.describe "invoices/index", :type => :view do
  before(:each) do
    assign(:invoices, [
      Invoice.create!(
        :prizes => "MyText"
      ),
      Invoice.create!(
        :prizes => "MyText"
      )
    ])
  end

  it "renders a list of invoices" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
