require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/space_roles/index.html.erb" do
  include SpaceRolesHelper
  
  before(:each) do
    assigns[:space_roles] = [
      stub_model(SpaceRole,
        :name => "value for name"),
      stub_model(SpaceRole,
        :name => "value for name")
    ]
  end

  it "should render list of space_roles" do
    render "/space_roles/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
  end
end

