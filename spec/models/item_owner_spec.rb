require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemOwner do
  before(:each) do
    @valid_attributes = {
      :item_reference_id => "1",
      :user_id => "1",
      :version => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    ItemOwner.create!(@valid_attributes)
  end
end
