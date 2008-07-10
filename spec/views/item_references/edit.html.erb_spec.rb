require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/item_references/edit.html.erb" do
  include ItemReferencesHelper
  
  before(:each) do
    assigns[:item_reference] = @item_reference = stub_model(ItemReference,
      :new_record? => false,
      :owners_version => "1",
    )
  end

  it "should render edit form" do
    render "/item_references/edit.html.erb"
    
    response.should have_tag("form[action=#{item_reference_path(@item_reference)}][method=post]") do
      with_tag('input#item_reference_owners_version[name=?]', "item_reference[owners_version]")
    end
  end
end


