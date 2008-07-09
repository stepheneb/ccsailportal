require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/space_roles/edit.html.erb" do
  include SpaceRolesHelper
  
  before(:each) do
    assigns[:space_role] = @space_role = stub_model(SpaceRole,
      :new_record? => false,
      :name => "value for name")
  end

  it "should render edit form" do
    render "/space_roles/edit.html.erb"
    
    response.should have_tag("form[action=#{space_role_path(@space_role)}][method=post]") do
      with_tag('input#space_role_name[name=?]', "space_role[name]")
    end
  end
end


