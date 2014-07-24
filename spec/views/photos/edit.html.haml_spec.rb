require 'rails_helper'

RSpec.describe "photos/edit", :type => :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :user_id => 1,
      :title => "MyString",
      :description => "MyText",
      :category => "MyText",
      :img_path => "MyString",
      :resized_img_path => "MyString"
    ))
  end

  it "renders the edit photo form" do
    render

    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do

      assert_select "input#photo_user_id[name=?]", "photo[user_id]"

      assert_select "input#photo_title[name=?]", "photo[title]"

      assert_select "textarea#photo_description[name=?]", "photo[description]"

      assert_select "textarea#photo_category[name=?]", "photo[category]"

      assert_select "input#photo_img_path[name=?]", "photo[img_path]"

      assert_select "input#photo_resized_img_path[name=?]", "photo[resized_img_path]"
    end
  end
end
