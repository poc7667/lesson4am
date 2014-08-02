require 'rails_helper'

RSpec.describe "joseph_memos/new", :type => :view do
  before(:each) do
    assign(:joseph_memo, JosephMemo.new(
      :name => "MyString",
      :title => "MyString",
      :words => "MyText",
      :videos => "MyText"
    ))
  end

  it "renders new joseph_memo form" do
    render

    assert_select "form[action=?][method=?]", joseph_memos_path, "post" do

      assert_select "input#joseph_memo_name[name=?]", "joseph_memo[name]"

      assert_select "input#joseph_memo_title[name=?]", "joseph_memo[title]"

      assert_select "textarea#joseph_memo_words[name=?]", "joseph_memo[words]"

      assert_select "textarea#joseph_memo_videos[name=?]", "joseph_memo[videos]"
    end
  end
end
