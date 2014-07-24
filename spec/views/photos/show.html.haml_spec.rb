require 'rails_helper'

RSpec.describe "photos/show", :type => :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :user_id => 1,
      :title => "Title",
      :description => "MyText",
      :category => "MyText",
      :img_path => "Img Path",
      :resized_img_path => "Resized Img Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Img Path/)
    expect(rendered).to match(/Resized Img Path/)
  end
end
