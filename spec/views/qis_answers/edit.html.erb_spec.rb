require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/qis_answers/edit.html.erb" do
  include QisAnswersHelper
  
  before(:each) do
    assigns[:qis_answer] = @qis_answer = stub_model(QisAnswer,
      :new_record? => false,
      :answer => "value for answer"
    )
  end

  it "should render edit form" do
    render "/qis_answers/edit.html.erb"
    
    response.should have_tag("form[action=#{qis_answer_path(@qis_answer)}][method=post]") do
      with_tag('input#qis_answer_answer[name=?]', "qis_answer[answer]")
    end
  end
end


