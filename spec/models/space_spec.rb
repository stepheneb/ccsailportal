require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Space do
  before(:each) do
    @root_space_attributes = {
      :name => "root",
      :description => "a space that doesn't have any parents, it is meant to only has children",
      :space_type => "site",
    }
    @valid_attributes = {
      :name => "myspace",
      :description => "a space for me",
      :space_type => "personal",
    }
  end

  it "should create a new instance given valid attributes" do
    Space.create!(@valid_attributes)
  end
  
  it "should reference it's parent when made a child" do
    root = Space.create!(@valid_attributes)
    child = Space.create!(@valid_attributes)
    child.move_to_child_of(root)
    child.parent.should eql(root)
  end
end
