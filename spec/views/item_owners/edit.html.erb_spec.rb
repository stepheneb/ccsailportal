require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/item_owners/edit.html.erb" do
  include ItemOwnersHelper
  
  before(:each) do
    assigns[:item_owner] = @item_owner = stub_model(ItemOwner,
      :new_record? => false,
      :version => "1"
    )
  end

  it "should render edit form" do
    render "/item_owners/edit.html.erb"
    
    response.should have_tag("form[action=#{item_owner_path(@item_owner)}][method=post]") do
      with_tag('input#item_owner_version[name=?]', "item_owner[version]")
    end
  end
end


