require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/qis_questions/edit.html.erb" do
  include QisQuestionsHelper
  
  before(:each) do
    assigns[:qis_question] = @qis_question = stub_model(QisQuestion,
      :new_record? => false,
      :prompt => "value for prompt"
    )
  end

  it "should render edit form" do
    render "/qis_questions/edit.html.erb"
    
    response.should have_tag("form[action=#{qis_question_path(@qis_question)}][method=post]") do
      with_tag('input#qis_question_prompt[name=?]', "qis_question[prompt]")
    end
  end
end


