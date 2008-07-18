require 'question_item_service_helper'

class QisQuestionCreationTool
  include QisItem
 
  def actions(offering)
    actions = []
      
    actions << "link_to('Create', new_offering_qis_question_url(#{offering.id}))"
  end
  
  def self.singleton
    if(!@singleton.nil?)
      return @singleton
    end
    
    @singleton = self.new
  end
end