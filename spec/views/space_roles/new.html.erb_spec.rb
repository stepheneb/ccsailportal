require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/space_roles/new.html.erb" do
  include SpaceRolesHelper
  
  before(:each) do
    assigns[:space_role] = stub_model(SpaceRole,
      :new_record? => true,
      :name => "value for name")
  end

  it "should render new form" do
    render "/space_roles/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", space_roles_path) do
      with_tag("input#space_role_name[name=?]", "space_role[name]")
    end
  end
end


