require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/item_references/new.html.erb" do
  include ItemReferencesHelper
  
  before(:each) do
    assigns[:item_reference] = stub_model(ItemReference,
      :new_record? => true,
      :owners_version => "1",
    )
  end

  it "should render new form" do
    render "/item_references/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", item_references_path) do
      with_tag("input#item_reference_owners_version[name=?]", "item_reference[owners_version]")
    end
  end
end


