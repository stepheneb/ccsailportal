require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/item_services/new.html.erb" do
  include ItemServicesHelper
  
  before(:each) do
    assigns[:item_service] = stub_model(ItemService,
      :new_record? => true,
      :type => "value for type"
    )
  end

  it "should render new form" do
    render "/item_services/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", item_services_path) do
      with_tag("input#item_service_type[name=?]", "item_service[type]")
    end
  end
end


