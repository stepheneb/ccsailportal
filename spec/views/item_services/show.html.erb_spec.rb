require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/item_services/show.html.erb" do
  include ItemServicesHelper
  
  before(:each) do
    assigns[:item_service] = @item_service = stub_model(ItemService,
      :type => "value for type"
    )
  end

  it "should render attributes in <p>" do
    render "/item_services/show.html.erb"
    response.should have_text(/value\ for\ type/)
  end
end

