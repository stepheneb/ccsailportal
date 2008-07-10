require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/offerings/index.html.erb" do
  include OfferingsHelper
  
  before(:each) do
    assigns[:offerings] = [
      stub_model(Offering,
      ),
      stub_model(Offering,
      )
    ]
  end

  it "should render list of offerings" do
    render "/offerings/index.html.erb"
  end
end

