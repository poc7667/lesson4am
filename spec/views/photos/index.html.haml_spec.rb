require 'rails_helper'

RSpec.describe "photos/index", :type => :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(
        :user_id => 1,
        :title => "Title",
        :description => "MyText",
        :category => "MyText",
        :img_path => "Img Path",
        :resized_img_path => "Resized Img Path"
      ),
      Photo.create!(
        :user_id => 1,
        :title => "Title",
        :description => "MyText",
        :category => "MyText",
        :img_path => "Img Path",
        :resized_img_path => "Resized Img Path"
      )
    ])
  end

  it "renders a list of photos" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Img Path".to_s, :count => 2
    assert_select "tr>td", :text => "Resized Img Path".to_s, :count => 2
  end
end
