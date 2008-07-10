require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/offerings/edit.html.erb" do
  include OfferingsHelper
  
  before(:each) do
    assigns[:offering] = @offering = stub_model(Offering,
      :new_record? => false,
    )
  end

  it "should render edit form" do
    render "/offerings/edit.html.erb"
    
    response.should have_tag("form[action=#{offering_path(@offering)}][method=post]") do
    end
  end
end


