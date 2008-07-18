require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/qis_questions/new.html.erb" do
  include QisQuestionsHelper
  
  before(:each) do
    assigns[:qis_question] = stub_model(QisQuestion,
      :new_record? => true,
      :prompt => "value for prompt"
    )
  end

  it "should render new form" do
    render "/qis_questions/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", qis_questions_path) do
      with_tag("input#qis_question_prompt[name=?]", "qis_question[prompt]")
    end
  end
end


