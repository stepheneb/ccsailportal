require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/qis_questions/index.html.erb" do
  include QisQuestionsHelper
  
  before(:each) do
    assigns[:qis_questions] = [
      stub_model(QisQuestion,
        :prompt => "value for prompt"
      ),
      stub_model(QisQuestion,
        :prompt => "value for prompt"
      )
    ]
  end

  it "should render list of qis_questions" do
    render "/qis_questions/index.html.erb"
    response.should have_tag("tr>td", "value for prompt", 2)
  end
end

