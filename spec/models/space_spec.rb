require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Space do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description",
      :space_type => "value for space_type",
      :parent_id => "1",
      :lft => "1",
      :rgt => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Space.create!(@valid_attributes)
  end
end
