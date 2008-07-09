require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/user_space_roles/show.html.erb" do
  include UserSpaceRolesHelper
  
  before(:each) do
    assigns[:user_space_role] = @user_space_role = stub_model(UserSpaceRole)
  end

  it "should render attributes in <p>" do
    render "/user_space_roles/show.html.erb"
  end
end

