require 'rails_helper'

RSpec.describe "invoices/show", :type => :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :prizes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
