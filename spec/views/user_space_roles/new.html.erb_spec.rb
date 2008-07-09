require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/user_space_roles/new.html.erb" do
  include UserSpaceRolesHelper
  
  before(:each) do
    assigns[:user_space_role] = stub_model(UserSpaceRole,
      :new_record? => true)
  end

  it "should render new form" do
    render "/user_space_roles/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", user_space_roles_path) do
    end
  end
end


