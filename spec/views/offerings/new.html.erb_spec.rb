require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/offerings/new.html.erb" do
  include OfferingsHelper
  
  before(:each) do
    assigns[:offering] = stub_model(Offering,
      :new_record? => true,
    )
  end

  it "should render new form" do
    render "/offerings/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", offerings_path) do
    end
  end
end


