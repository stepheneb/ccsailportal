require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/item_references/show.html.erb" do
  include ItemReferencesHelper
  
  before(:each) do
    assigns[:item_reference] = @item_reference = stub_model(ItemReference,
      :owners_version => "1",
    )
  end

  it "should render attributes in <p>" do
    render "/item_references/show.html.erb"
    response.should have_text(/1/)
  end
end

