require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/item_services/edit.html.erb" do
  include ItemServicesHelper
  
  before(:each) do
    assigns[:item_service] = @item_service = stub_model(ItemService,
      :new_record? => false,
      :type => "value for type"
    )
  end

  it "should render edit form" do
    render "/item_services/edit.html.erb"
    
    response.should have_tag("form[action=#{item_service_path(@item_service)}][method=post]") do
      with_tag('input#item_service_type[name=?]', "item_service[type]")
    end
  end
end


