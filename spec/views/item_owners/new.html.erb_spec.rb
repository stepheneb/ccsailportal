require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/item_owners/new.html.erb" do
  include ItemOwnersHelper
  
  before(:each) do
    assigns[:item_owner] = stub_model(ItemOwner,
      :new_record? => true,
      :version => "1"
    )
  end

  it "should render new form" do
    render "/item_owners/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", item_owners_path) do
      with_tag("input#item_owner_version[name=?]", "item_owner[version]")
    end
  end
end


