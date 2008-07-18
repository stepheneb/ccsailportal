require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/qis_questions/show.html.erb" do
  include QisQuestionsHelper
  
  before(:each) do
    assigns[:qis_question] = @qis_question = stub_model(QisQuestion,
      :prompt => "value for prompt"
    )
  end

  it "should render attributes in <p>" do
    render "/qis_questions/show.html.erb"
    response.should have_text(/value\ for\ prompt/)
  end
end

