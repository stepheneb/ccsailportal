require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/item_references/index.html.erb" do
  include ItemReferencesHelper
  
  before(:each) do
    assigns[:item_references] = [
      stub_model(ItemReference,
        :owners_version => "1",
      ),
      stub_model(ItemReference,
        :owners_version => "1",
      )
    ]
  end

  it "should render list of item_references" do
    render "/item_references/index.html.erb"
    response.should have_tag("tr>td", "1", 2)
  end
end

