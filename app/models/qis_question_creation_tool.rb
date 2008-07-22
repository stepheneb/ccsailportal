class QisQuestionCreationTool < NonArItem
 
  def actions(offering)
    actions = []
      
    actions << "link_to('Create', new_offering_qis_question_url(#{offering.id}))"
  end

  def self.singleton_item
    QisQuestionCreationTool.find_or_create_by_item_service_id(QuestionItemService.first)
  end
end