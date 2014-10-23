require 'rails_helper'

RSpec.describe "invoices/edit", :type => :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :prizes => "MyText"
    ))
  end

  it "renders the edit invoice form" do
    render

    assert_select "form[action=?][method=?]", invoice_path(@invoice), "post" do

      assert_select "textarea#invoice_prizes[name=?]", "invoice[prizes]"
    end
  end
end
