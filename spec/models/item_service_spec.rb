require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemService do
  before(:each) do
    @valid_attributes = {
      :type => "value for type"
    }
  end

  it "should create a new instance given valid attributes" do
    ItemService.create!(@valid_attributes)
  end
end
