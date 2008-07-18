require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/qis_answers/index.html.erb" do
  include QisAnswersHelper
  
  before(:each) do
    assigns[:qis_answers] = [
      stub_model(QisAnswer,
        :answer => "value for answer"
      ),
      stub_model(QisAnswer,
        :answer => "value for answer"
      )
    ]
  end

  it "should render list of qis_answers" do
    render "/qis_answers/index.html.erb"
    response.should have_tag("tr>td", "value for answer", 2)
  end
end

