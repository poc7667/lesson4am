require 'rails_helper'

RSpec.describe "joseph_memos/show", :type => :view do
  before(:each) do
    @joseph_memo = assign(:joseph_memo, JosephMemo.create!(
      :name => "Name",
      :title => "Title",
      :words => "MyText",
      :videos => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
