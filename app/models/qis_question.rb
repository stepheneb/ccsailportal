class QisQuestion < ActiveRecord::Base
  include Item
  include QisArItem
  
  def actions(offering)
    actions = []
      
    # if this question is the thing being offered then there are methods
    # answer the question
    # if this offering is not this question then it is probably the question
    # creation tool, so this question is just one thing created by that tool 
    if(offering.item == self)
      actions << "link_to('Answer', new_offering_qis_answer_url(#{offering.id}))"
      actions << "link_to('Report', offering_qis_answers_url(#{offering.id}))"
    else
      actions << "link_to('Edit', edit_qis_question_url(#{self.id}))"      
    end
  end

end
