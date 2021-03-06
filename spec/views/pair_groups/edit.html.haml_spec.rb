require 'rails_helper'

RSpec.describe "pair_groups/edit", :type => :view do
  before(:each) do
    @pair_group = assign(:pair_group, PairGroup.create!(
      :user_id => 1,
      :title => "MyString",
      :description => "MyString",
      :text => "MyString",
      :members => "MyString",
      :text => "MyString"
    ))
  end

  it "renders the edit pair_group form" do
    render

    assert_select "form[action=?][method=?]", pair_group_path(@pair_group), "post" do

      assert_select "input#pair_group_user_id[name=?]", "pair_group[user_id]"

      assert_select "input#pair_group_title[name=?]", "pair_group[title]"

      assert_select "input#pair_group_description[name=?]", "pair_group[description]"

      assert_select "input#pair_group_text[name=?]", "pair_group[text]"

      assert_select "input#pair_group_members[name=?]", "pair_group[members]"

      assert_select "input#pair_group_text[name=?]", "pair_group[text]"
    end
  end
end
