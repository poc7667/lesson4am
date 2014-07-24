require 'rails_helper'

RSpec.describe "pair_groups/index", :type => :view do
  before(:each) do
    assign(:pair_groups, [
      PairGroup.create!(
        :user_id => 1,
        :title => "Title",
        :description => "Description",
        :text => "Text",
        :members => "Members",
        :text => "Text"
      ),
      PairGroup.create!(
        :user_id => 1,
        :title => "Title",
        :description => "Description",
        :text => "Text",
        :members => "Members",
        :text => "Text"
      )
    ])
  end

  it "renders a list of pair_groups" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => "Members".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
