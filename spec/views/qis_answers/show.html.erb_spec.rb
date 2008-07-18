require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/qis_answers/show.html.erb" do
  include QisAnswersHelper
  
  before(:each) do
    assigns[:qis_answer] = @qis_answer = stub_model(QisAnswer,
      :answer => "value for answer"
    )
  end

  it "should render attributes in <p>" do
    render "/qis_answers/show.html.erb"
    response.should have_text(/value\ for\ answer/)
  end
end

