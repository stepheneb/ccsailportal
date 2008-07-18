require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/spaces/new.html.erb" do
  include SpacesHelper
  
  before(:each) do
    assigns[:space] = stub_model(Space,
      :new_record? => true,
      :name => "value for name",
      :description => "value for description",
      :space_type => "value for space_type",
      :lft => "1",
      :rgt => "1"
    )
  end

  it "should render new form" do
    render "/spaces/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", spaces_path) do
      with_tag("input#space_name[name=?]", "space[name]")
      with_tag("input#space_description[name=?]", "space[description]")
      with_tag("input#space_space_type[name=?]", "space[space_type]")
      with_tag("input#space_lft[name=?]", "space[lft]")
      with_tag("input#space_rgt[name=?]", "space[rgt]")
    end
  end
end


