module QisArItem
  def item_service()
    # assume there is only one QuestionItemService
    QuestionItemService.first
  end
  
end
