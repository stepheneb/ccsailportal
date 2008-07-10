require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/spaces/edit.html.erb" do
  include SpacesHelper
  
  before(:each) do
    assigns[:space] = @space = stub_model(Space,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description",
      :space_type => "value for space_type",
      :lft => "1",
      :rgt => "1"
    )
  end

  it "should render edit form" do
    render "/spaces/edit.html.erb"
    
    response.should have_tag("form[action=#{space_path(@space)}][method=post]") do
      with_tag('input#space_name[name=?]', "space[name]")
      with_tag('input#space_description[name=?]', "space[description]")
      with_tag('input#space_space_type[name=?]', "space[space_type]")
      with_tag('input#space_lft[name=?]', "space[lft]")
      with_tag('input#space_rgt[name=?]', "space[rgt]")
    end
  end
end


