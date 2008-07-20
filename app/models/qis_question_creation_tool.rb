module QisQuestionCreationTool
 
  def actions(offering)
    actions = []
      
    actions << "link_to('Create', new_offering_qis_question_url(#{offering.id}))"
  end

  def self.singleton_item
    NonArItem.find_or_create_by_item_service_id_and_external_item_id(QuestionItemService.first, self.name)
  end
end