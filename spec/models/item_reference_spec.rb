require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemReference do
  before(:each) do
    @valid_attributes = {
      :item_service_id => "1",
      :owners_version => "1",
      :item_id => "value for item_id"
    }
  end

  it "should create a new instance given valid attributes" do
    ItemReference.create!(@valid_attributes)
  end
end
