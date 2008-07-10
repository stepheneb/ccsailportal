require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Offering do
  before(:each) do
    @valid_attributes = {
      :space_id => "1",
      :item_reference_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Offering.create!(@valid_attributes)
  end
end
