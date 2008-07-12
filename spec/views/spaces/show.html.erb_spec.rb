require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/spaces/show.html.erb" do
  include SpacesHelper
  
  before(:each) do
    assigns[:space] = @space = stub_model(Space,
      :name => "value for name",
      :description => "value for description",
      :space_type => "value for space_type"
    )
  end

  it "should render attributes in <p>" do
    render "/spaces/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/value\ for\ space_type/)
  end
end

