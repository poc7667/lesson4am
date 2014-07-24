require 'rails_helper'

RSpec.describe "pair_groups/show", :type => :view do
  before(:each) do
    @pair_group = assign(:pair_group, PairGroup.create!(
      :user_id => 1,
      :title => "Title",
      :description => "Description",
      :text => "Text",
      :members => "Members",
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/Members/)
    expect(rendered).to match(/Text/)
  end
end
