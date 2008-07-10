require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/item_services/index.html.erb" do
  include ItemServicesHelper
  
  before(:each) do
    assigns[:item_services] = [
      stub_model(ItemService,
        :type => "value for type"
      ),
      stub_model(ItemService,
        :type => "value for type"
      )
    ]
  end

  it "should render list of item_services" do
    render "/item_services/index.html.erb"
    response.should have_tag("tr>td", "value for type", 2)
  end
end

