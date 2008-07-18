require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe QisQuestion do
  before(:each) do
    @valid_attributes = {
      :prompt => "value for prompt"
    }
  end

  it "should create a new instance given valid attributes" do
    QisQuestion.create!(@valid_attributes)
  end
end
