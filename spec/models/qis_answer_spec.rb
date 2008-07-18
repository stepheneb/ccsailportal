require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe QisAnswer do
  before(:each) do
    @valid_attributes = {
      :question_id => "1",
      :answer => "value for answer"
    }
  end

  it "should create a new instance given valid attributes" do
    QisAnswer.create!(@valid_attributes)
  end
end
