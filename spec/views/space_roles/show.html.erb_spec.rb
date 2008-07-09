require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/space_roles/show.html.erb" do
  include SpaceRolesHelper
  
  before(:each) do
    assigns[:space_role] = @space_role = stub_model(SpaceRole,
      :name => "value for name")
  end

  it "should render attributes in <p>" do
    render "/space_roles/show.html.erb"
    response.should have_text(/value\ for\ name/)
  end
end

