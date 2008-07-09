require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/user_space_roles/index.html.erb" do
  include UserSpaceRolesHelper
  
  before(:each) do
    assigns[:user_space_roles] = [
      stub_model(UserSpaceRole),
      stub_model(UserSpaceRole)
    ]
  end

  it "should render list of user_space_roles" do
    render "/user_space_roles/index.html.erb"
  end
end

