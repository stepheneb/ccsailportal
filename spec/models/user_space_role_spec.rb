require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSpaceRole do
  before(:each) do
    @valid_attributes = {
      :user_id => "1",
      :space_role_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    UserSpaceRole.create!(@valid_attributes)
  end
end
