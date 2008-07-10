require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/offerings/show.html.erb" do
  include OfferingsHelper
  
  before(:each) do
    assigns[:offering] = @offering = stub_model(Offering,
    )
  end

  it "should render attributes in <p>" do
    render "/offerings/show.html.erb"
  end
end

