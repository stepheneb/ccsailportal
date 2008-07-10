require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/spaces/index.html.erb" do
  include SpacesHelper
  
  before(:each) do
    assigns[:spaces] = [
      stub_model(Space,
        :name => "value for name",
        :description => "value for description",
        :space_type => "value for space_type",
        :lft => "1",
        :rgt => "1"
      ),
      stub_model(Space,
        :name => "value for name",
        :description => "value for description",
        :space_type => "value for space_type",
        :lft => "1",
        :rgt => "1"
      )
    ]
  end

  it "should render list of spaces" do
    render "/spaces/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for description", 2)
    response.should have_tag("tr>td", "value for space_type", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

