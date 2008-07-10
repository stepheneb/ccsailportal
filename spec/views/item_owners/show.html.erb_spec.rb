require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/item_owners/show.html.erb" do
  include ItemOwnersHelper
  
  before(:each) do
    assigns[:item_owner] = @item_owner = stub_model(ItemOwner,
      :version => "1"
    )
  end

  it "should render attributes in <p>" do
    render "/item_owners/show.html.erb"
    response.should have_text(/1/)
  end
end

