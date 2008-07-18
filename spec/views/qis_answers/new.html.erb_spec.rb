require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/qis_answers/new.html.erb" do
  include QisAnswersHelper
  
  before(:each) do
    assigns[:qis_answer] = stub_model(QisAnswer,
      :new_record? => true,
      :answer => "value for answer"
    )
  end

  it "should render new form" do
    render "/qis_answers/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", qis_answers_path) do
      with_tag("input#qis_answer_answer[name=?]", "qis_answer[answer]")
    end
  end
end


