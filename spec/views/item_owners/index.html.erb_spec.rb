require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/item_owners/index.html.erb" do
  include ItemOwnersHelper
  
  before(:each) do
    assigns[:item_owners] = [
      stub_model(ItemOwner,
        :version => "1"
      ),
      stub_model(ItemOwner,
        :version => "1"
      )
    ]
  end

  it "should render list of item_owners" do
    render "/item_owners/index.html.erb"
    response.should have_tag("tr>td", "1", 2)
  end
end

