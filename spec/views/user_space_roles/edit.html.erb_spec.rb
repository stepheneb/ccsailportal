require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/user_space_roles/edit.html.erb" do
  include UserSpaceRolesHelper
  
  before(:each) do
    assigns[:user_space_role] = @user_space_role = stub_model(UserSpaceRole,
      :new_record? => false)
  end

  it "should render edit form" do
    render "/user_space_roles/edit.html.erb"
    
    response.should have_tag("form[action=#{user_space_role_path(@user_space_role)}][method=post]") do
    end
  end
end


