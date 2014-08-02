require 'rails_helper'

RSpec.describe "joseph_memos/index", :type => :view do
  before(:each) do
    assign(:joseph_memos, [
      JosephMemo.create!(
        :name => "Name",
        :title => "Title",
        :words => "MyText",
        :videos => "MyText"
      ),
      JosephMemo.create!(
        :name => "Name",
        :title => "Title",
        :words => "MyText",
        :videos => "MyText"
      )
    ])
  end

  it "renders a list of joseph_memos" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
